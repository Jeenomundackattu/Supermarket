﻿namespace 超市管理系统.系统设置
{
    partial class H_SM_adminlevelSetupAdd
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txtnumber = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtdiscount = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtdown = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtup = new System.Windows.Forms.TextBox();
            this.btsave = new System.Windows.Forms.Button();
            this.btexit = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.cboname = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(30, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "级别编号：";
            // 
            // txtnumber
            // 
            this.txtnumber.Location = new System.Drawing.Point(126, 24);
            this.txtnumber.Name = "txtnumber";
            this.txtnumber.ReadOnly = true;
            this.txtnumber.Size = new System.Drawing.Size(100, 21);
            this.txtnumber.TabIndex = 1;
            this.txtnumber.Text = "自动生成";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(30, 69);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 12);
            this.label2.TabIndex = 0;
            this.label2.Text = "级别名称：";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(30, 109);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 12);
            this.label3.TabIndex = 0;
            this.label3.Text = "级别折扣：";
            // 
            // txtdiscount
            // 
            this.txtdiscount.Location = new System.Drawing.Point(126, 106);
            this.txtdiscount.Name = "txtdiscount";
            this.txtdiscount.Size = new System.Drawing.Size(100, 21);
            this.txtdiscount.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(30, 149);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 12);
            this.label4.TabIndex = 0;
            this.label4.Text = "积分下限：";
            // 
            // txtdown
            // 
            this.txtdown.Location = new System.Drawing.Point(126, 146);
            this.txtdown.Name = "txtdown";
            this.txtdown.Size = new System.Drawing.Size(100, 21);
            this.txtdown.TabIndex = 1;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(30, 190);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(65, 12);
            this.label5.TabIndex = 0;
            this.label5.Text = "积分上限：";
            // 
            // txtup
            // 
            this.txtup.Location = new System.Drawing.Point(126, 187);
            this.txtup.Name = "txtup";
            this.txtup.Size = new System.Drawing.Size(100, 21);
            this.txtup.TabIndex = 1;
            // 
            // btsave
            // 
            this.btsave.Location = new System.Drawing.Point(75, 232);
            this.btsave.Name = "btsave";
            this.btsave.Size = new System.Drawing.Size(75, 23);
            this.btsave.TabIndex = 2;
            this.btsave.Text = "确定";
            this.btsave.UseVisualStyleBackColor = true;
            this.btsave.Click += new System.EventHandler(this.btsave_Click);
            // 
            // btexit
            // 
            this.btexit.Location = new System.Drawing.Point(186, 231);
            this.btexit.Name = "btexit";
            this.btexit.Size = new System.Drawing.Size(75, 23);
            this.btexit.TabIndex = 3;
            this.btexit.Text = "退出";
            this.btexit.UseVisualStyleBackColor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.ForeColor = System.Drawing.Color.Red;
            this.label6.Location = new System.Drawing.Point(232, 106);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(59, 12);
            this.label6.TabIndex = 0;
            this.label6.Text = "0.9为九折";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.ForeColor = System.Drawing.Color.Red;
            this.label7.Location = new System.Drawing.Point(232, 118);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 12);
            this.label7.TabIndex = 0;
            this.label7.Text = "1为不打折";
            // 
            // cboname
            // 
            this.cboname.FormattingEnabled = true;
            this.cboname.Items.AddRange(new object[] {
            "高级会员",
            "中级会员",
            "普通会员"});
            this.cboname.Location = new System.Drawing.Point(126, 64);
            this.cboname.Name = "cboname";
            this.cboname.Size = new System.Drawing.Size(100, 20);
            this.cboname.TabIndex = 4;
            // 
            // H_SM_adminlevelSetupAdd
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(341, 275);
            this.Controls.Add(this.cboname);
            this.Controls.Add(this.btexit);
            this.Controls.Add(this.btsave);
            this.Controls.Add(this.txtup);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtdown);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtdiscount);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtnumber);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "H_SM_adminlevelSetupAdd";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "增加会员级别";
            this.Load += new System.EventHandler(this.H_SM_adminlevelSetupAdd_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtnumber;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtdiscount;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtdown;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtup;
        private System.Windows.Forms.Button btsave;
        private System.Windows.Forms.Button btexit;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cboname;
    }
}