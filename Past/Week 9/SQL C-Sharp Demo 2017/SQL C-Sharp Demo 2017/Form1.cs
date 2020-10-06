using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

/*****************************************************
/* For diconnected access, use DataSet and DataAdapter objects.
 * Fill the data set from the database using an SQL command and the 
 * DataAdapter.Fill(DataSet) operation. The DataSet contents can
 * be modified like any other in-memory collection object. Write
 * the modified data back out to the SQL database with
 * the DataAdapter.Update(DataSet) command.
 * Connected access is also possible. Use a DataReader
 * object to pull in the records you want, and use the
 * ExecuteNonQuery command for direct SQL Insert, Update
 * and Delete operations.
 * 
 * Note that there is a lot more to the ADO.NET classes than
 * just this introduction. See, for example, the DataSet.Relations
 * collection that lets you build UI controls that automatically
 * perform table JOINs. See MSDN or other ADO.NET references for more
 * detail.
 * 
 * 
 *****************************************************/

// Names space for the ADO.NET classes
using System.Data.SqlClient;


namespace SQL_C_Sharp_Demo_2017
{

    public partial class Form1 : Form
    {
        //--------------------------------------------------------
        // Addtional class properties
        //--------------------------------------------------------

        // SqlConnection object handles logging into the server
        SqlConnection sqlConnection;


        // SqlDataAdapter manages communication between VS and SQL Server
        SqlDataAdapter dataAdapter;


        // DataSet object will hold the working (client-side) record set. 
        // It can contain multiple tables
        DataSet agricultureDataSet;

        //--------------------------------------------------------
        //--------------------------------------------------------
 
        public Form1()
        {
            InitializeComponent();
        }

        //--------------------------------------------------------
        //--------------------------------------------------------
 
        private void Form1_Load(object sender, EventArgs e)
        {
            // Set up the database connection here.
            // Open and Close it as required

            // Create ADO objects
            sqlConnection = new SqlConnection();

            // Used for disconnected database work
            agricultureDataSet = new DataSet();
            dataAdapter = new SqlDataAdapter();
          
            // Initialise the ConnectionString property of the SQConnection
            // object instance. Subsequently call sqlConnection.Open() and sqlConnection.Close()

              sqlConnection.ConnectionString = "Server=127.0.0.1;" +
                                               "Database=AdventureWorks;" +
                                               "User ID=sa;" +
                                               "Password=**********";

        }

        //--------------------------------------------------------
        // Connected Read
        //--------------------------------------------------------
        private void button1_Click_1(object sender, EventArgs e)
        {
            SqlCommand directCommand = new SqlCommand("SELECT g.Name, " +
                                                "p.Name, " +
                                                "h.harvestDate " +
                                                "FROM Technician g JOIN Harvest h " +
                                                "ON g.ID = h.technicianID " +
                                                "JOIN Crop p ON p.ID = h.cropID",
                                                sqlConnection);
            sqlConnection.Open();

            SqlDataReader directReader = directCommand.ExecuteReader();

            if (directReader.HasRows)
            {
                while (directReader.Read())
                {
                    lstDisplay.Items.Add(directReader.GetString(0) + "\t" +
                                         directReader.GetString(1) + "\t" +
                                         directReader.GetDateTime(2).ToShortDateString());
                }
            }
            else
                lstDisplay.Items.Add("No rows found.");

            sqlConnection.Close();
        }

        //--------------------------------------------------------
        // Connected Insert: This code changes the external database.
        //--------------------------------------------------------
        private void btnDirectInsert_Click(object sender, EventArgs e)
        {
            //Create SqlCommand object instance
            SqlCommand insertCommand = new SqlCommand();

            // Initialise CommandType, CommandText and Connection properties
            insertCommand.CommandType = System.Data.CommandType.Text;

            insertCommand.CommandText = "INSERT INTO Sowing VALUES (1,2,1,'20120326', 35)";

            insertCommand.Connection = sqlConnection;

            // Open connection, execute command, then close connection
            sqlConnection.Open();
            insertCommand.ExecuteNonQuery();        // This runs the SQL against the Db 
            sqlConnection.Close();
        }

        //--------------------------------------------------------
        // Connected Delete: This code changes the external database
        //--------------------------------------------------------
        private void btnDirectDelete_Click(object sender, EventArgs e)
        {
            // Procedure is identical to connected insert.

            // Create
            SqlCommand deleteCommand = new SqlCommand();

            // Initialise
            deleteCommand.CommandType = System.Data.CommandType.Text;
            deleteCommand.CommandText = "DELETE FROM Sowing WHERE cropID = '1'";
            deleteCommand.Connection = sqlConnection;

            // Execute
            sqlConnection.Open();
            deleteCommand.ExecuteNonQuery();
            sqlConnection.Close();
        }


        //-----------------------------------------------------------------------------------------------//
        // Disconnected access using DataAdapter and DataSet
        //-----------------------------------------------------------------------------------------------//


        //--------------------------------------------------------
        // Basic read, filling a DataSet object.
        //--------------------------------------------------------
        private void btnFill_Click(object sender, EventArgs e)
        {
            // Fill a DataSet object from a database by using a DataAdapter.

            // Define the SQL statement as a string
            String selectString = "SELECT * FROM Sowing";

            // Create a SqlCommand object with the SQl string and connection
            SqlCommand selectCommand = new SqlCommand(selectString, sqlConnection);

            // Assign the select command to the DataAdapter (created in the Form_Load)    
            dataAdapter.SelectCommand = selectCommand;

            // Fill the DataSet using the DataAdapter
            // The fill command optionally takes a name for the table you are creating
            sqlConnection.Open();
            dataAdapter.Fill(agricultureDataSet, "Sowing");
            sqlConnection.Close();

            // To display the contents, iterate over the DataSet object, drilling down through 
            //its collection structure.

            // Pull out the DataTable from the Tables collection (see below for how to load multiple tables)
            DataTable sowingTable = agricultureDataSet.Tables["Sowing"];

            // Iterate over the DataTable's Rows property
            foreach (DataRow currentRecord in sowingTable.Rows)
            {
                //Each DataRow holds its contents in its ItemArray property
                String printRecord = "";
                for (int i=0; i<currentRecord.ItemArray.Length; i++)
                    printRecord += (currentRecord.ItemArray[i] + "\t");
                lstDisplay.Items.Add(printRecord);
            }

            // You can also treat the records as associative arrays if you know the columns names
            foreach (DataRow currentRecord in sowingTable.Rows)
            {
                //Each DataRow holds its contents in its ItemArray property
                String printRecord = currentRecord["cropID"] + "\t" +
                                     currentRecord["technicianID"] + "\t" +
                                     currentRecord["locationID"] + "\t" +
                                     currentRecord["sowingDate"] + "\t" +
                                     currentRecord["sowingSeeds"];
                lstDisplay.Items.Add(printRecord);
            }

        }
 
        //--------------------------------------------------------
        // Filling a DataSet with a complex SELECT
        //--------------------------------------------------------
        private void btnJoin_Click(object sender, EventArgs e)
        {
            //The SQL statement used to fill a DataSet can be
            // as complex as you like

            dataAdapter.SelectCommand = new SqlCommand("SELECT c.Name, " +
                                                       "t.Name, " +
                                                       "s.sowingSeeds " +
                                                       "FROM "+
                                                       "(Crop c JOIN Sowing s ON c.ID = s.cropID) " +
                                                       "JOIN Technician t ON s.technicianID = t.ID", sqlConnection);
           
                                                       
            sqlConnection.Open();
            dataAdapter.Fill(agricultureDataSet, "Joined Sowing");
            sqlConnection.Close();

            // Pull out the DataTable
            DataTable joinedSowingTable = agricultureDataSet.Tables["Joined Sowing"];

            // Iterate over the DataTable's Rows property
            foreach (DataRow currentRecord in joinedSowingTable.Rows)
            {
                //Each DataRow holds its contents in its ItemArray property
                String printRecord = "";
                for (int i = 0; i < currentRecord.ItemArray.Length; i++)
                    printRecord += (currentRecord.ItemArray[i] + "\t");
                lstDisplay.Items.Add(printRecord);
            }

        }
        //--------------------------------------------------------
        // Read multiple tables into a DataSet
        //--------------------------------------------------------
        private void btnMultipleTables_Click(object sender, EventArgs e)
        {
            // Load multiple tables into a DataSet by executing multiple
            // SelectCommands. (Note that there are alternative methods
            // for doing this, but this one is clearest, IMO.)

            dataAdapter.SelectCommand = new SqlCommand("SELECT * FROM Crop", sqlConnection);
            sqlConnection.Open();
            dataAdapter.Fill(agricultureDataSet,"Crop");

            dataAdapter.SelectCommand = new SqlCommand("SELECT * FROM Technician", sqlConnection);
            dataAdapter.Fill(agricultureDataSet, "Technician");

            dataAdapter.SelectCommand = new SqlCommand("SELECT * FROM Sowing", sqlConnection);
            dataAdapter.Fill(agricultureDataSet, "Sowing");

            sqlConnection.Close();

            // Now iterate over all the DataTables in the DataSet.Tables collection
            foreach(DataTable currentTable in agricultureDataSet.Tables)
            {
                lstDisplay.Items.Add(currentTable.TableName);
                foreach (DataRow currentRecord in currentTable.Rows)
                {
                    //Each DataRow holds its contents in its ItemArray property
                    String printRecord = "";
                    for (int i = 0; i < currentRecord.ItemArray.Length; i++)
                        printRecord += (currentRecord.ItemArray[i] + "\t");
                    lstDisplay.Items.Add(printRecord);
                }
            }

        }

        //--------------------------------------------------------
        // Automatically display records in a DataGridView
        //--------------------------------------------------------
        private void btnBind_Click(object sender, EventArgs e)
        {
            // You can automate the output process by binding a DataTable
            // directly to a DataGridView obj

            //Fill
            dataAdapter.SelectCommand = new SqlCommand("SELECT c.Name, " +
                                                       "t.Name, " +
                                                       "s.sowingSeeds " +
                                                       "FROM " +
                                                       "(Crop c JOIN Sowing s ON c.ID = s.cropID) " +
                                                       "JOIN technician t ON s.technicianID = t.ID", sqlConnection);


            sqlConnection.Open();
            dataAdapter.Fill(agricultureDataSet, "Joined Sowing");
            sqlConnection.Close();

            // Bind
            DataTable joinDataTable = agricultureDataSet.Tables[0];

            //BindingSource bindingSource = new BindingSource();
            //bindingSource.DataSource = joinDataTable;
            //dataGridView1.DataSource = bindingSource;

            // Or, shorter but gives you less control...
            dataGridView1.DataSource = joinDataTable.DefaultView;

        }

        // For modification demos
        SqlDataAdapter TechnicianAdapter;


        //----------------------------------------------------------------------------
        // Modifying the database when working in disconnected mode. Example 1: Insert
        //----------------------------------------------------------------------------
        private void button1_Click(object sender, EventArgs e)
        {
            // So far we have only used the SelectCommand
            // property of the DataAdapter. But these objects
            // also have InsertCommand, DeleteCommand and UpdateCommand.
            // The InsertCommand and DeleteCommand propoerties
            // act as templates for modifying the SQL database. 
            // They can contain only a single SQL statement. 
            // So, if you want to modify several tables, it is efficient
            // to create a new DataAdapter for each table. Otherwise
            // you will have to keep modifying the DataAdapter commands.

            // To modify the external database, you first modify the local copy
            // working directly on the DataTables in DataSet.Tables, using C# statements.
            // When you want to write your changes back out to the
            // external SQL Server database, you call DataAdapter.Update(DataSet)
            // This writes the changes in your local copy out to the 
            // external drive using DataAdapter.InsertCommand as a template.

            // As before, there are alternative ways to do this work,
            // because of syntactic variation and overloading. See
            // appropriate references for more detail.

            // Watch the handling of the identity fields....

            // Working with a single table
            TechnicianAdapter = new SqlDataAdapter();

            // Create SelectCommand and fill a table in the DataSet
            TechnicianAdapter.SelectCommand = new SqlCommand("SELECT * FROM Technician", sqlConnection);

            // Note that we use the same DataSet object here for all our DataAdapters and tables
            sqlConnection.Open();
            TechnicianAdapter.Fill(agricultureDataSet, "Technician");
            sqlConnection.Close();

            // Create the InsertCommand
            // Note the use of @ to single placeholders for arguments pass at call
            SqlCommand insertCommand = new SqlCommand("INSERT INTO Technician " + 
                                                      "VALUES (@Name)", sqlConnection);

            
            // Initialise the parameters for the SqlCommand object.
            insertCommand.Parameters.Add("@Name", SqlDbType.Char, 25, "Name");
  
            // Assign the prepared insertCommand object to the DataAdapter
            // Note that a DataAdapter can only hold one InsertCommand value at a time
            TechnicianAdapter.InsertCommand = insertCommand;


            // Insert a row into the local object agricultureDataSet

            // Get the DataTable
            DataTable localTechnician = agricultureDataSet.Tables["Technician"];
            
            // A DataTable's NewRow method creates a row with all the named fields. You build the
            // record you want to insert.
            DataRow newTechnicianRow = localTechnician.NewRow();
            newTechnicianRow["Name"] = "Bob"; // you could of course read this from a UI control

            // Add the new row to the DataTable. 
            localTechnician.Rows.Add(newTechnicianRow);

            // NB: This changes ONLY the local copy.
            // If we look at this table in SSMS, we don't see any change.
            // To get the data out to SQL Server, we must call DataAdapter.Update
            // (see below)
        }

         //----------------------------------------------------------------------------
         // Modifying the database when working in disconnected mode. Example 2: Delete
         //----------------------------------------------------------------------------
        private void btnDelete_Click(object sender, EventArgs e)
        {
            // Delete works just like insert
            // 1) Define template command for DataAdapter
            // 2) Make local change
            // 3) Must then call Update to make remote change

            // In practice, you wouldn't need to create a new DataAdapter.
            // One DataAdapter for each table will usually be sufficient. You can assign its SelectCommand,
            // InsertCommand, DeleteCommand and UpdateCommand properties all at the same time.
            // When you subsequently call its Update method, all changes to the local copy will
            // be written to the external database using the SQL in those properties.

            // We just create a new one here so you can see all the code in a single method.
            TechnicianAdapter = new SqlDataAdapter();

            // Create SelectCommand and fill a table in the DataSet
            TechnicianAdapter.SelectCommand = new SqlCommand("SELECT * FROM Technician", sqlConnection);

            // Note that we use the same DataSet object here for all our 
            // DataAdapters and tables
            sqlConnection.Open();
            TechnicianAdapter.Fill(agricultureDataSet, "Technician");
            sqlConnection.Close();

            // Create the DeleteCommand
            // Note the use of @ to single placeholders for arguments pass at call
            SqlCommand deleteCommand = new SqlCommand("DELETE FROM Technician " +
                                                      "WHERE Name = @Name", sqlConnection);


            // Initialise the parameters for the insertCommand object.
            deleteCommand.Parameters.Add("@Name", SqlDbType.Char, 25, "Name");

            // Assign the prepared insertCommand object to the DataAdapter
            TechnicianAdapter.DeleteCommand = deleteCommand;


            // Delete a test row

            // Get the DataTable
            DataTable localTechnician = agricultureDataSet.Tables["Technician"];

            // Find Bob (IRL there would be error checking and UI and so forth)
            DataRow bobRow = null;
            foreach (DataRow r in localTechnician.Rows)
            {
                String trimmedName = r["Name"].ToString().Trim();
                if (trimmedName == "Bob")
                {
                    bobRow = r;
                    break;
                }
            }


            // Delete bobRow from the local copy 
            bobRow.Delete();


            // NB: This changes ONLY the local copy.
            // If we look at this table in SSMS, we don't see any change.
            // To get the data out to SQL Server, we must call DataAdapter.Update
            // (see below)
        }


        //--------------------------------------------------------
        // Copying local changes out to the external database
        //--------------------------------------------------------
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            // This single call to Update copies all the Insert, Delete and Update changes
            // you have made to the local copy using the DataAdapter's InsertCommand, DeleteCommand
            // and UpdateCommand (left as an exercise) properties as templates.
            TechnicianAdapter.Update(agricultureDataSet, "Technician");
        }

        //--------------------------------------------------------------------------------------------------
        // Utilities
        //--------------------------------------------------------------------------------------------------

        //--------------------------------------------------------------------------------------------
        // Empty a DataSet. Note that DataSet.Clear() only empties the tables. Reset() removes them.
        //--------------------------------------------------------------------------------------------
        private void btnResest_Click(object sender, EventArgs e)
        {
            agricultureDataSet.Reset();
            MessageBox.Show("Emptied agricultureDataSet");
        }

        //-------------------------------------------------------
        // Display main DataSet in the ListBox
        //-------------------------------------------------------

        private void btnShowLocal_Click(object sender, EventArgs e)
        {
            lstDisplay.Items.Clear();
            lstDisplay.Items.Add("Printing Local Copy");
            // Now loop over all the DataTables in the DataSet.Tables collection
            foreach (DataTable currentTable in agricultureDataSet.Tables)
            {
                lstDisplay.Items.Add(currentTable.TableName);
                foreach (DataRow currentRecord in currentTable.Rows)
                {
                    //Each DataRow holds its contents in its ItemArray property
                    String printRecord = "";
                    for (int i = 0; i < currentRecord.ItemArray.Length; i++)
                        printRecord += (currentRecord.ItemArray[i] + "\t");
                    lstDisplay.Items.Add(printRecord);
                }
            }
        }
  
 
    } //end Form
} // end namespace
