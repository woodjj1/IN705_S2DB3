namespace SQL_C_Sharp_Demo_2017
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btnFill = new System.Windows.Forms.Button();
            this.lstDisplay = new System.Windows.Forms.ListBox();
            this.btnJoin = new System.Windows.Forms.Button();
            this.btnMultipleTables = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnBind = new System.Windows.Forms.Button();
            this.btnInsertLocal = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.btnShowLocal = new System.Windows.Forms.Button();
            this.btnResest = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnDirectInsert = new System.Windows.Forms.Button();
            this.btnDirectDelete = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // btnFill
            // 
            this.btnFill.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFill.Location = new System.Drawing.Point(10, 16);
            this.btnFill.Name = "btnFill";
            this.btnFill.Size = new System.Drawing.Size(135, 32);
            this.btnFill.TabIndex = 0;
            this.btnFill.Text = "Fill and Display";
            this.btnFill.UseVisualStyleBackColor = true;
            this.btnFill.Click += new System.EventHandler(this.btnFill_Click);
            // 
            // lstDisplay
            // 
            this.lstDisplay.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstDisplay.FormattingEnabled = true;
            this.lstDisplay.ItemHeight = 20;
            this.lstDisplay.Location = new System.Drawing.Point(12, 54);
            this.lstDisplay.Name = "lstDisplay";
            this.lstDisplay.Size = new System.Drawing.Size(415, 244);
            this.lstDisplay.TabIndex = 1;
            // 
            // btnJoin
            // 
            this.btnJoin.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnJoin.Location = new System.Drawing.Point(151, 16);
            this.btnJoin.Name = "btnJoin";
            this.btnJoin.Size = new System.Drawing.Size(135, 32);
            this.btnJoin.TabIndex = 2;
            this.btnJoin.Text = "Join";
            this.btnJoin.UseVisualStyleBackColor = true;
            this.btnJoin.Click += new System.EventHandler(this.btnJoin_Click);
            // 
            // btnMultipleTables
            // 
            this.btnMultipleTables.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMultipleTables.Location = new System.Drawing.Point(292, 16);
            this.btnMultipleTables.Name = "btnMultipleTables";
            this.btnMultipleTables.Size = new System.Drawing.Size(135, 32);
            this.btnMultipleTables.TabIndex = 3;
            this.btnMultipleTables.Text = "Multiple Tables";
            this.btnMultipleTables.UseVisualStyleBackColor = true;
            this.btnMultipleTables.Click += new System.EventHandler(this.btnMultipleTables_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 338);
            this.dataGridView1.Name = "dataGridView1";
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView1.RowHeadersDefaultCellStyle = dataGridViewCellStyle5;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dataGridView1.RowsDefaultCellStyle = dataGridViewCellStyle6;
            this.dataGridView1.Size = new System.Drawing.Size(343, 242);
            this.dataGridView1.TabIndex = 4;
            // 
            // btnBind
            // 
            this.btnBind.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBind.Location = new System.Drawing.Point(12, 304);
            this.btnBind.Name = "btnBind";
            this.btnBind.Size = new System.Drawing.Size(170, 32);
            this.btnBind.TabIndex = 5;
            this.btnBind.Text = "Bind to DataGridView";
            this.btnBind.UseVisualStyleBackColor = true;
            this.btnBind.Click += new System.EventHandler(this.btnBind_Click);
            // 
            // btnInsertLocal
            // 
            this.btnInsertLocal.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInsertLocal.Location = new System.Drawing.Point(615, 16);
            this.btnInsertLocal.Name = "btnInsertLocal";
            this.btnInsertLocal.Size = new System.Drawing.Size(144, 32);
            this.btnInsertLocal.TabIndex = 6;
            this.btnInsertLocal.Text = "Insert Local Record";
            this.btnInsertLocal.UseVisualStyleBackColor = true;
            this.btnInsertLocal.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdate.Location = new System.Drawing.Point(615, 113);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(144, 32);
            this.btnUpdate.TabIndex = 7;
            this.btnUpdate.Text = "Write Out Change";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // btnShowLocal
            // 
            this.btnShowLocal.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShowLocal.Location = new System.Drawing.Point(433, 16);
            this.btnShowLocal.Name = "btnShowLocal";
            this.btnShowLocal.Size = new System.Drawing.Size(135, 32);
            this.btnShowLocal.TabIndex = 8;
            this.btnShowLocal.Text = "Show Local Copy";
            this.btnShowLocal.UseVisualStyleBackColor = true;
            this.btnShowLocal.Click += new System.EventHandler(this.btnShowLocal_Click);
            // 
            // btnResest
            // 
            this.btnResest.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnResest.Location = new System.Drawing.Point(433, 68);
            this.btnResest.Name = "btnResest";
            this.btnResest.Size = new System.Drawing.Size(135, 32);
            this.btnResest.TabIndex = 9;
            this.btnResest.Text = "Reset Dataset";
            this.btnResest.UseVisualStyleBackColor = true;
            this.btnResest.Click += new System.EventHandler(this.btnResest_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.Location = new System.Drawing.Point(615, 54);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(144, 32);
            this.btnDelete.TabIndex = 10;
            this.btnDelete.Text = "Delete Local Record";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnDirectInsert
            // 
            this.btnDirectInsert.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDirectInsert.Location = new System.Drawing.Point(433, 237);
            this.btnDirectInsert.Name = "btnDirectInsert";
            this.btnDirectInsert.Size = new System.Drawing.Size(135, 29);
            this.btnDirectInsert.TabIndex = 12;
            this.btnDirectInsert.Text = "Direct Insert";
            this.btnDirectInsert.UseVisualStyleBackColor = true;
            this.btnDirectInsert.Click += new System.EventHandler(this.btnDirectInsert_Click);
            // 
            // btnDirectDelete
            // 
            this.btnDirectDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDirectDelete.Location = new System.Drawing.Point(433, 269);
            this.btnDirectDelete.Name = "btnDirectDelete";
            this.btnDirectDelete.Size = new System.Drawing.Size(135, 29);
            this.btnDirectDelete.TabIndex = 13;
            this.btnDirectDelete.Text = "Direct Delete";
            this.btnDirectDelete.UseVisualStyleBackColor = true;
            this.btnDirectDelete.Click += new System.EventHandler(this.btnDirectDelete_Click);
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(433, 202);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(135, 29);
            this.button1.TabIndex = 14;
            this.button1.Text = "Direct Read";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 592);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnDirectDelete);
            this.Controls.Add(this.btnDirectInsert);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnResest);
            this.Controls.Add(this.btnShowLocal);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.btnInsertLocal);
            this.Controls.Add(this.btnBind);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.btnMultipleTables);
            this.Controls.Add(this.btnJoin);
            this.Controls.Add(this.lstDisplay);
            this.Controls.Add(this.btnFill);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnFill;
        private System.Windows.Forms.ListBox lstDisplay;
        private System.Windows.Forms.Button btnJoin;
        private System.Windows.Forms.Button btnMultipleTables;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnBind;
        private System.Windows.Forms.Button btnInsertLocal;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button btnShowLocal;
        private System.Windows.Forms.Button btnResest;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnDirectInsert;
        private System.Windows.Forms.Button btnDirectDelete;
        private System.Windows.Forms.Button button1;
    }
}

