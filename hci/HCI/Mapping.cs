﻿using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using HCI;

namespace HCI
{
    public class Mapping
    {
        //Globals
        public static readonly int SEPARATE = 1;
        public static readonly int LATFIRST = 2;
        public static readonly int LONGFIRST = 3;

        //Datatypes
        private string tableName;
        private string latFieldName;
        private string longFieldName;
        private int format;

        //Functions

        //Constructor
        public Mapping()
        {

        }

        //Getters

        //Retrieve tableName
        public string getTableName()
        {
            return this.tableName;
        }

        //Retrieve latFieldName
        public string getLatFieldName()
        {
            return this.latFieldName;
        }

        //Retrieve longFieldName
        public string getLongFieldName()
        {
            return this.longFieldName;
        }

        //Retrieve format
        public int getFormat()
        {
            return this.format;
        }

        //Setters

        //Set tableName
        public void setTableName(string tableName)
        {
            this.tableName = tableName;
        }

        //Set latFieldName
        public void setLatFieldName(string latFieldName)
        {
            this.latFieldName = latFieldName;
        }

        //Set longFieldName
        public void setLongFieldName(string longFieldName)
        {
            this.longFieldName = longFieldName;
        }

        //Set format
        public void setFormat(int format)
        {
            this.format = format;
        }

        //Additional
        public bool isValid(DataTable LLTable)
        {
            bool valid = true;
            
            try
            {             
                foreach (DataRow dr in LLTable.Rows)
                {
                    foreach (Object data in dr.ItemArray)
                    {
                        double test = double.Parse(data.ToString());
                    }
                }
            }
            catch (Exception e)
            {
                valid = false;
                return valid;
            }
            return valid;
        }

        //Seperating Long from Lat and vise versa
        public double[] separate(string cord, int order)
        {
            int mid;
            if (cord.Contains(','))
                mid = cord.IndexOf(',');
            else if (cord.Contains('|'))
                mid = cord.IndexOf('|');
            else if (cord.Contains('/'))
                mid = cord.IndexOf('/');
            else if (cord.Contains('\\'))
                mid = cord.IndexOf('\\');
            else if (cord.Contains(' '))
                mid = cord.IndexOf(' ');
            else
            {
                throw new ODBC2KMLException("Not a correct format of Latitude and Longitude");
            }


            String p1 = "", p2 = "",cord2;
            int i;
            for (i = 0; i < mid; i++)
            {}    
            
            p1 = cord.Substring(0,i);

            p2 = cord.Substring(++mid, cord.Length-i-1);
            
            double q1 = 0;
            double q2 = 0;
            try
            {
                q1.Equals(double.Parse(p1));
                q2.Equals(double.Parse(p2));
                if (order.Equals(LATFIRST))
                {
                    double[] coordinates = new double[2];
                    coordinates[0] = q1;
                    coordinates[1] = q2;

                    return coordinates;
                    //latFieldName = p1;
                    //longFieldName = p2;
                }
                else
                {
                    double[] coordinates = new double[2];
                    coordinates[0] = q2;
                    coordinates[1] = q1;

                    return coordinates;

                    //latFieldName = p2;
                    //longFieldName = p1;
                }

            }
            catch (Exception e)
            {
                throw new ODBC2KMLException("This is not a Longitude and Latitude Coordinate.");
            }
        }

        /// <summary>
        /// Get all of the mappings associated with a given connection.
        /// </summary>
        /// <param name="connID">int --> connection ID</param>
        /// <returns>ArrayList --> Contains all mappings associated with this connection</returns>
        public static ArrayList getMappings(int connID)
        {
            ArrayList mapping = new ArrayList();
            Database localDatabase = new Database();

            //Create mapping query and populate table
            string query = "SELECT * FROM Mapping WHERE connID=" + connID;
            DataTable table = localDatabase.executeQueryLocal(query);

            foreach (DataRow row in table.Rows)
            {
                Mapping map = new Mapping();

                foreach (DataColumn col in table.Columns)
                {
                    //Set mapping
                    switch (col.ColumnName)
                    {
                        case "tableName":
                            map.setTableName(row[col].ToString());
                            break;
                        case "latFieldName":
                            map.setLatFieldName(row[col].ToString());
                            break;
                        case "longFieldName":
                            map.setLongFieldName(row[col].ToString());
                            break;
                        case "format":
                            map.setFormat((int)row[col]);
                            break;
                        default:
                            break;                  
                    }
                }
                //Add mapping to list
                mapping.Add(map);
                map = null;
            }//End outer loop

            return mapping;
        }

        public static void insertMapping(int connID, string tableName, string latFieldName, string longFieldName, int format)
        {
            Mapping mapping = new Mapping();
            Database localDatabase = new Database();

            string query = "INSERT INTO MAPPING VALUES ('" + tableName+ "', '" + latFieldName + "', '" + longFieldName + "', '" + format + "', '" + connID + "')";
            localDatabase.executeQueryLocal(query);
        }

        public static void updateMapping(int connID, string tableName, string latFieldName, string longFieldName, int format)
        {
            Mapping mapping = new Mapping();
            Database localDatabase = new Database();

            string query = "UPDATE MAPPING SET latFieldName = '" + latFieldName + "', longFieldName = '" + longFieldName + "', format = '"+ format +"' WHERE connID = '" + connID + "' AND tableName = '" + tableName + "'";
            localDatabase.executeQueryLocal(query);
        }

        /// <summary>
        /// Get a specific mapping for a given tableName. Used to generate KML
        /// </summary>
        /// <param name="connID">int --> connection ID</param>
        /// <param name="tableName">String --> Table name you want to fetch the mapping for</param>
        /// <returns>Mapping --> Mapping of specific table name</returns>
        public static Mapping getMapping(int connID, string tableName)
        {
            Mapping mapping = new Mapping();
            Database localDatabase = new Database();

            //Create mapping query and populate table
            string query = "SELECT * FROM Mapping WHERE connID='" + connID + "' AND tableName = '" + tableName + "'";
            DataTable table = localDatabase.executeQueryLocal(query);

            foreach (DataRow row in table.Rows)
            {
                foreach (DataColumn col in table.Columns)
                {
                    //Set mapping
                    switch (col.ColumnName)
                    {
                        case "tableName":
                            mapping.setTableName(row[col].ToString());
                            break;
                        case "latFieldName":
                            mapping.setLatFieldName(row[col].ToString());
                            break;
                        case "longFieldName":
                            mapping.setLongFieldName(row[col].ToString());
                            break;
                        case "format":
                            mapping.setFormat((int)row[col]);
                            break;
                        default:
                            break;

                    }
                }
            }//End outer loop

            return mapping;
        }

        public static Mapping getDeepCopyOfMapping(int connID)
        {
            Mapping mapping = new Mapping();

            Database localDatabase = new Database();

            //Create mapping query and populate table
            string query = "SELECT * FROM Mapping WHERE connID='" + connID + "'";
            DataTable table = localDatabase.executeQueryLocal(query);

            foreach (DataRow row in table.Rows)
            {
                foreach (DataColumn col in table.Columns)
                {
                    //Set mapping
                    switch (col.ColumnName)
                    {
                        case "tableName":
                            mapping.setTableName(row[col].ToString());
                            break;
                        case "latFieldName":
                            mapping.setLatFieldName(row[col].ToString());
                            break;
                        case "longFieldName":
                            mapping.setLongFieldName(row[col].ToString());
                            break;
                        case "format":
                            mapping.setFormat((int)row[col]);
                            break;
                        default:
                            break;

                    }
                }
            }//End outer loop

            return mapping;
        }

    }
}
