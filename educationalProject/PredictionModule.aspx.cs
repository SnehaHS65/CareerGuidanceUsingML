using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Collections;
using System.Threading;
using System.Configuration;

namespace educationalProject
{
    public partial class PredictionModule : System.Web.UI.Page
    {
        Dictionary<string, string> DictionaryAllFrequentItems = new Dictionary<string, string>();
        Dictionary<string, string> _FrequentItems = new Dictionary<string, string>();


        protected void Page_Load(object sender, EventArgs e)
        {
            TrainingDS();
        }

        private void TrainingDS()
        {
            string FileName = "TrainingDataset.xls";

            string Extension = ".xls";

            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

            string _Location = "TrainingDataset";

            string FilePath = Server.MapPath(FolderPath + FileName);

            Import_To_Grid(FilePath, Extension, _Location);
        }

        #region -- Eclat Algorithm ---

        //main function which contains the main steps of the eclat algorithm
        private void EclatAlgorithm()
        {
            try
            {
                //double _X = 0;
                //_X = double.Parse(lv_Transactions.Items.Count.ToString()) / 20;

                double _supportCnt = (double.Parse(lv_Transactions.Items.Count.ToString()) / 100) * 10.2;
                double _confidence = 0.28;

                //function to calculate the L1 and store in buffer
                Dictionary<string, string> _FrequentItemsMain = L1(_supportCnt);
                Dictionary<string, string> _Candidates = new Dictionary<string, string>();

                do
                {
                    //function to calculate C2,C3.... and store in buffer
                    _Candidates = GenerateCandidates(_FrequentItemsMain);

                    //function to calculate L2,L3.... and store in buffer
                    _FrequentItemsMain = GetFrequentItems(_Candidates, _supportCnt);
                }

                while (_Candidates.Count != 0);

                //function to generate rules or patterns
                List<ClassRules> RulesList = GenerateRules();
                //compare with the confidence and find strong rules
                List<ClassRules> StrongRules = GetStrongRules(_confidence, RulesList);

                //function to display the final results (L and Patterns)
                Result(DictionaryAllFrequentItems, StrongRules);
            }
            catch
            {

            }
        }

        //function to find L1
        private Dictionary<string, string> L1(double MinSupport)
        {
            Dictionary<string, string> DictionaryFrequentItemsReturn = new Dictionary<string, string>();
            _FrequentItems.Clear();

            for (int i = 0; i < lv_Items.Items.Count; i++)
            {
                string _Support = GetSupport(lv_Items.Items[i].Text.ToString());

                string[] Id = _Support.Split(',');

                if ((int.Parse(Id.Length.ToString()) >= MinSupport))
                {
                    DictionaryFrequentItemsReturn.Add(lv_Items.Items[i].Text.ToString(), _Support);

                    //temp buffer                   
                    _FrequentItems.Add(lv_Items.Items[i].Text.ToString(), _Support);

                    DictionaryAllFrequentItems.Add(lv_Items.Items[i].Text.ToString(), _Support);
                }
            }
            return DictionaryFrequentItemsReturn;
        }

        //function to find the support of items
        private string GetSupport(string GeneratedCandidate)
        {
            string _SupportReturn = null;

            string[] AllTransactions = new string[lv_Transactions.Items.Count];
            string[] AllTransactionsId = new string[lv_TransactionsId.Items.Count];

            for (int i = 0; i < lv_Transactions.Items.Count; i++)
            {
                AllTransactions[i] = lv_Transactions.Items[i].Text.ToString();
                AllTransactionsId[i] = lv_TransactionsId.Items[i].Text.ToString();
            }

            for (int j = 0; j < lv_Transactions.Items.Count; j++)
            {
                if (IsSubstring(GeneratedCandidate, lv_Transactions.Items[j].Text.ToString()))
                {
                    _SupportReturn += lv_TransactionsId.Items[j].Text.ToString() + ",";
                }
            }

            if (_SupportReturn != null)
            {
                _SupportReturn = _SupportReturn.Substring(0, _SupportReturn.Length - 1);
            }

            return _SupportReturn;
        }

        //function to find the support of items(new)
        private string NewSupport(string GeneratedCandidate)
        {
            string _SupportReturn = null;

            if (_FrequentItems.Count > 0)
            {
                string[] _C = GeneratedCandidate.Split(',');

                string[] AllTransactionsId = new string[lv_TransactionsId.Items.Count];

                for (int j = 0; j < _FrequentItems.Count; j++)
                {
                    if (_C.Contains(_FrequentItems.ElementAt(j).Key))
                    {

                    }

                    if (IsSubstring(GeneratedCandidate, lv_Transactions.Items[j].Text.ToString()))
                    {
                        _SupportReturn += lv_TransactionsId.Items[j].Text.ToString() + ",";
                    }
                }

                if (_SupportReturn != null)
                {
                    _SupportReturn = _SupportReturn.Substring(0, _SupportReturn.Length - 1);
                }
            }

            return _SupportReturn;
        }

        //function to check if the item exisits in a given transaction
        private bool IsSubstring(string Child, string Parent)
        {
            string[] TransactionArray = Child.Split(',');
            //string value = null;
            foreach (string Item in TransactionArray)
            {
                if (!Parent.Contains(Item))
                    return false;
            }
            return true;
        }

        //function to find C2, C3, C4.....
        private Dictionary<string, string> GenerateCandidates(Dictionary<string, string> MainFrequentItems)
        {
            Dictionary<string, string> DictionaryCandidatesReturn = new Dictionary<string, string>();
            for (int i = 0; i < MainFrequentItems.Count - 1; i++)
            {
                string[] FirstItem = Alphabetize(MainFrequentItems.Keys.ElementAt(i));
                string FirstItemString = null;
                for (int k = 0; k < FirstItem.Length; k++)
                {
                    FirstItemString += FirstItem[k].ToString() + ",";
                }
                FirstItemString = FirstItemString.Remove(FirstItemString.Length - 1);
                for (int j = i + 1; j < MainFrequentItems.Count; j++)
                {
                    string[] SecondItem = Alphabetize(MainFrequentItems.Keys.ElementAt(j));
                    string SecondItemString = null;
                    for (int l = 0; l < SecondItem.Length; l++)
                    {
                        SecondItemString += SecondItem[l].ToString() + ",";
                    }
                    SecondItemString = SecondItemString.Remove(SecondItemString.Length - 1);
                    string GeneratedCandidate = GetCandidate(FirstItemString, SecondItemString);

                    if (GeneratedCandidate != string.Empty)
                    {
                        string[] CandidateArray = Alphabetize(GeneratedCandidate);
                        GeneratedCandidate = "";
                        for (int m = 0; m < CandidateArray.Length; m++)
                        {
                            GeneratedCandidate += CandidateArray[m].ToString() + ",";
                        }

                        GeneratedCandidate = GeneratedCandidate.Remove(GeneratedCandidate.Length - 1);
                        string Support = GetSupport(GeneratedCandidate);
                        DictionaryCandidatesReturn.Add(GeneratedCandidate, Support);
                    }
                }
            }
            return DictionaryCandidatesReturn;
        }

        //function to set in alphabetical order
        private string[] Alphabetize(string Token)
        {
            // Convert to char array, then sort and return
            string[] TokenArray = Token.Split(',');
            Array.Sort(TokenArray);
            return TokenArray;
        }

        //function to get the candidate excluding the similar items
        private string GetCandidate(string FirstItemString, string SecondItemString)
        {
            string CandidateJoin = null;
            if (FirstItemString.Contains(',') || SecondItemString.Contains(','))
            {
                string[] First = FirstItemString.Split(',');
                string[] Second = SecondItemString.Split(',');
                if (First[0] != Second[0])
                {
                    return string.Empty;
                }
                else
                {
                    string firstString = FirstItemString.Substring(0, FirstItemString.LastIndexOf(','));
                    string secondString = SecondItemString.Substring(0, SecondItemString.LastIndexOf(','));
                    if (firstString == secondString)
                    {
                        return FirstItemString + SecondItemString.Substring(SecondItemString.LastIndexOf(','));
                    }
                    else
                    {
                        return string.Empty;
                    }
                }
            }
            else
            {
                return FirstItemString + "," + SecondItemString;
            }
        }

        //Function to find L through given support
        private Dictionary<string, string> GetFrequentItems(Dictionary<string, string> CandidatesDictionary, double MinimumSupport)
        {
            Dictionary<string, string> FrequentReturn = new Dictionary<string, string>();
            for (int i = CandidatesDictionary.Count - 1; i >= 0; i--)
            {
                string Item = CandidatesDictionary.Keys.ElementAt(i);
                string Support = CandidatesDictionary[Item];

                if (Support != null)
                {
                    string[] Id = Support.Split(',');

                    if ((Id.Length >= MinimumSupport))
                    {
                        FrequentReturn.Add(Item, Support);
                        DictionaryAllFrequentItems.Add(Item, Support);
                    }
                }
            }
            return FrequentReturn;
        }

        //Generate Rules
        private List<ClassRules> GenerateRules()
        {
            List<ClassRules> RulesReturnList = new List<ClassRules>();
            foreach (string Item in DictionaryAllFrequentItems.Keys)
            {
                string[] ItemArray = Item.Split(',');
                if (ItemArray.Length > 1)
                {
                    int MaxCombinationLength = ItemArray.Length / 2;
                    GenerateCombination(Item, MaxCombinationLength, ref RulesReturnList);
                }
            }
            return RulesReturnList;
        }

        private void GenerateCombination(string Item, int CombinationLength, ref List<ClassRules> RulesReturnList)
        {
            string[] ItemArray = Item.Split(',');
            int ItemLength = ItemArray.Length;
            if (ItemLength == 2)
            {
                AddItem(ItemArray[0].ToString(), Item, ref RulesReturnList);
                return;
            }
            else if (ItemLength == 3)
            {
                for (int i = 0; i < ItemLength; i++)
                {
                    AddItem(ItemArray[i].ToString(), Item, ref RulesReturnList);
                }
                return;
            }
            else
            {
                for (int i = 0; i < ItemLength; i++)
                {
                    GetCombinationRecursive(ItemArray[i].ToString(), Item, CombinationLength, ref RulesReturnList);
                }
            }
        }

        private void AddItem(string Combination, string Item, ref List<ClassRules> RulesReturnList)
        {
            string Remaining = GetRemaining(Combination, Item);
            ClassRules Rule = new ClassRules(Combination, Remaining, 0);
            RulesReturnList.Add(Rule);
        }

        private string GetCombinationRecursive(string Combination, string Item, int CombinationLength, ref List<ClassRules> RulesReturnList)
        {
            AddItem(Combination, Item, ref RulesReturnList);
            string LastTokenItem = Combination;
            if (Combination.Contains(','))
                LastTokenItem = Combination.Substring(Combination.LastIndexOf(',') + 1);

            string NextItem = null; ;
            string LastItem = Item.Substring(Item.LastIndexOf(',') + 1);
            if (Combination.Split(',').Length == CombinationLength)
            {
                if (LastTokenItem != LastItem)
                {
                    string TempCombination = null;
                    foreach (string str in Combination.Split(','))
                    {
                        if (str != LastTokenItem)
                        {
                            TempCombination = TempCombination + "," + str;
                        }
                    }
                    Combination = TempCombination.Substring(1);
                    string[] strs = Item.Split(',');
                    for (int i = 0; i < strs.Length; i++)
                    {
                        if (strs[i] == LastTokenItem)
                        {
                            NextItem = strs[i + 1];
                        }
                    }
                    //Combination = Combination.Remove(nLastTokenCharcaterIndex, 1);
                    //NextItem = Item[nLastTokenCharcaterIndexInParent + 1];
                    string strNewToken = Combination + "," + NextItem;
                    return (GetCombinationRecursive(strNewToken, Item, CombinationLength, ref RulesReturnList));
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                if (Combination != LastItem.ToString())
                {
                    string[] strs = Item.Split(',');
                    for (int i = 0; i < strs.Length; i++)
                    {
                        if (strs[i] == LastTokenItem)
                        {
                            NextItem = strs[i + 1];
                        }
                    }
                    //NextItem = Item[nLastTokenCharcaterIndexInParent + 1];
                    string strNewToken = Combination + "," + NextItem;
                    return (GetCombinationRecursive(strNewToken, Item, CombinationLength, ref RulesReturnList));
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        private string GetRemaining(string Child, string Parent)
        {
            string[] childArray = Child.Split(',');

            for (int i = 0; i < childArray.Length; i++)
            {
                string Remaining = null;
                string[] ParentArray = Parent.Split(',');
                for (int j = 0; j < ParentArray.Length; j++)
                {
                    if (childArray[i] != ParentArray[j])
                    {
                        Remaining = Remaining + "," + ParentArray[j];
                    }
                }

                if (Remaining.Contains(','))
                    Parent = Remaining.Substring(1);
                else
                    Parent = Remaining;
            }
            return Parent;
        }

        //funciton to generate strong rules
        private List<ClassRules> GetStrongRules(double MinConfidence, List<ClassRules> RulesList)
        {
            List<ClassRules> StrongRulesReturn = new List<ClassRules>();

            foreach (ClassRules Rule in RulesList)
            {
                string[] XY = Alphabetize(Rule.X + "," + Rule.Y);
                string XYString = null;
                for (int i = 0; i < XY.Length; i++)
                {
                    XYString += XY[i] + ",";
                }
                XYString = XYString.Remove(XYString.Length - 1);
                AddStrongRule(Rule, XYString, ref StrongRulesReturn, MinConfidence);
            }

            StrongRulesReturn.Sort();

            return StrongRulesReturn;
        }

        private void AddStrongRule(ClassRules Rule, string XY, ref List<ClassRules> StrongRulesReturn, double MinConfidence)
        {
            double Confidence = GetConfidence(Rule.X, XY);
            ClassRules NewRule;

            if (Confidence >= MinConfidence)
            {
                NewRule = new ClassRules(Rule.X, Rule.Y, Confidence);
                StrongRulesReturn.Add(NewRule);
            }

            Confidence = GetConfidence(Rule.Y, XY);

            if (Confidence >= MinConfidence)
            {
                NewRule = new ClassRules(Rule.Y, Rule.X, Confidence);
                StrongRulesReturn.Add(NewRule);
            }
        }

        private double GetConfidence(string X, string XY)
        {
            string Support_X, Support_XY;
            Support_X = DictionaryAllFrequentItems[X];
            Support_XY = DictionaryAllFrequentItems[XY];

            string[] Id1 = Support_X.Split(',');
            string[] Id2 = Support_XY.Split(',');

            return (double.Parse(Id2.Length.ToString()) / double.Parse(Id1.Length.ToString()));
        }

        //function to display the final output
        public void Result(Dictionary<string, string> AllFrequentItems, List<ClassRules> StrongRulesList)
        {
            LoadFrequentItems(AllFrequentItems);
            LoadRules(StrongRulesList);
        }

        private void LoadFrequentItems(Dictionary<string, string> AllFrequentItems)
        {
            foreach (string Item in AllFrequentItems.Keys)
            {
                ListItem items = new ListItem(Item);
                ListBox1.Items.Add(items);
            }
        }

        private void LoadRules(List<ClassRules> StrongRulesList)
        {
            Table4.Rows.Clear();

            Table4.BorderStyle = BorderStyle.Double;
            Table4.GridLines = GridLines.Both;
            Table4.BorderColor = System.Drawing.Color.DarkGray;

            TableRow mainrow = new TableRow();
            mainrow.HorizontalAlign = HorizontalAlign.Left;
            mainrow.Height = 30;
            mainrow.ForeColor = System.Drawing.Color.White;
            mainrow.Font.Bold = true;
            mainrow.BackColor = System.Drawing.Color.DeepSkyBlue;

            TableHeaderCell cell1 = new TableHeaderCell();
            cell1.Width = 250;
            cell1.Text = "Rule X";
            mainrow.Controls.Add(cell1);

            TableHeaderCell cell3 = new TableHeaderCell();
            cell3.Width = 100;
            cell3.Text = "->";
            mainrow.Controls.Add(cell3);

            TableHeaderCell cell4 = new TableHeaderCell();
            cell4.Width = 250;
            cell4.Text = "Rule Y";
            mainrow.Controls.Add(cell4);

            TableHeaderCell cell2 = new TableHeaderCell();
            cell2.Text = "Confidence";
            mainrow.Controls.Add(cell2);

            Table4.Controls.Add(mainrow);

            int i = 0;

            if (StrongRulesList.Count > 0)
            {
                //Session["patterns"] = StrongRulesList;
                ListBox2.Items.Clear();

                foreach (ClassRules Rule in StrongRulesList)
                {
                    if (Rule.Y.Contains(','))
                    {
                        string[] _SM = Rule.Y.Split(',');

                        if (_SM.Contains("IT") || _SM.Contains("BANK SECTOR") || _SM.Contains("TEACHING") || _SM.Contains("BUSINESS"))
                        {
                            for (int j = 0; j < _SM.Length; j++)
                            {
                                if (_SM[j].Contains("IT") || _SM[j].Contains("BANK SECTOR") || _SM[j].Contains("TEACHING") || _SM[j].Contains("BUSINESS"))
                                {
                                    ListItem items = new ListItem(Rule.X + "->" + Rule.Y);
                                    ListBox2.Items.Add(items);

                                    TableRow row = new TableRow();

                                    TableCell cellX1 = new TableCell();
                                    cellX1.Text = Rule.X;
                                    row.Controls.Add(cellX1);

                                    TableCell cell_rule2 = new TableCell();
                                    //cell_rule2.HorizontalAlign = HorizontalAlign.Center;
                                    cell_rule2.Width = 100;
                                    cell_rule2.Text = "->";
                                    row.Controls.Add(cell_rule2);


                                    TableCell cellY1 = new TableCell();
                                    cellY1.Text = _SM[j];
                                    row.Controls.Add(cellY1);

                                    TableCell cell_confidence = new TableCell();
                                    cell_confidence.HorizontalAlign = HorizontalAlign.Left;
                                    cell_confidence.Width = 100;
                                    cell_confidence.Text = String.Format("{0:0.00}", (Rule.Confidence * 100)) + "%";
                                    row.Controls.Add(cell_confidence);

                                    Table4.Controls.Add(row);
                                }
                            }
                        }

                    }
                    else
                    {
                        if (Rule.Y.Contains("IT") || Rule.Y.Contains("BANK SECTOR") || Rule.Y.Contains("TEACHING") || Rule.Y.Contains("BUSINESS"))
                        {
                            ListItem items = new ListItem(Rule.X + "->" + Rule.Y);
                            ListBox2.Items.Add(items);

                            TableRow row = new TableRow();

                            TableCell cellX1 = new TableCell();
                            cellX1.Text = Rule.X;
                            row.Controls.Add(cellX1);

                            TableCell cell_rule2 = new TableCell();
                            //cell_rule2.HorizontalAlign = HorizontalAlign.Center;
                            cell_rule2.Width = 100;
                            cell_rule2.Text = "->";
                            row.Controls.Add(cell_rule2);


                            TableCell cellY1 = new TableCell();
                            cellY1.Text = Rule.Y;
                            row.Controls.Add(cellY1);

                            TableCell cell_confidence = new TableCell();
                            cell_confidence.HorizontalAlign = HorizontalAlign.Left;
                            cell_confidence.Width = 100;
                            cell_confidence.Text = String.Format("{0:0.00}", (Rule.Confidence * 100)) + "%";
                            row.Controls.Add(cell_confidence);

                            Table4.Controls.Add(row);
                        }
                    }

                    ++i;
                }
            }
            else
            {
                Table4.Rows.Clear();
                Table4.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.HorizontalAlign = HorizontalAlign.Center;
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.ColumnSpan = 5;
                cell.Text = "No Pattrens Found for the Input!!!";
                row.Controls.Add(cell);

                Table4.Controls.Add(row);
            }
        }




        #endregion
                     
        private void Import_To_Grid(string FilePath, string Extension, string _Location)
        {
            string conStr = "";

            switch (Extension)
            {

                case ".xls": //Excel 97-03

                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]

                             .ConnectionString;

                    break;

                case ".xlsx": //Excel 07

                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]

                              .ConnectionString;

                    break;

            }

            conStr = String.Format(conStr, FilePath, _Location);

            OleDbConnection connExcel = new OleDbConnection(conStr);

            OleDbCommand cmdExcel = new OleDbCommand();

            OleDbDataAdapter oda = new OleDbDataAdapter();

            DataTable dt = new DataTable();

            cmdExcel.Connection = connExcel;

            //Get the name of First Sheet

            connExcel.Open();

            DataTable dtExcelSchema;

            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

            connExcel.Close();

            //Read Data from First Sheet

            connExcel.Open();

            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";

            oda.SelectCommand = cmdExcel;

            oda.Fill(dt);

            //BLL obj = new BLL();

            if (dt.Rows.Count > 0)
            {
                //Bind Data to GridView
                lv_Transactions.Items.Clear();
                lv_Items.Items.Clear();
                DictionaryAllFrequentItems.Clear();
                ListBox1.Items.Clear();
                ListBox2.Items.Clear();

                int _Ids = 100;

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string _transaction = dt.Rows[i]["SSLC"].ToString() + "," + dt.Rows[i]["CPP"].ToString() + "," +
                        dt.Rows[i]["JAVA"].ToString() + "," + dt.Rows[i]["CS"].ToString() + "," + dt.Rows[i]["APTITUDE"].ToString() + "," + dt.Rows[i]["RESULT"].ToString();

                    lv_Transactions.Items.Add(_transaction);
                    lv_TransactionsId.Items.Add(_Ids.ToString());

                    //code to identify the distinct items
                    string[] items = null;
                    items = lv_Transactions.Items[i].Text.Split(',');

                    for (int w = 0; w < items.Length; w++)
                    {
                        ListItem item = new ListItem();
                        item.Text = items[w];

                        if (lv_Items.Items.Contains(item))
                        {

                        }
                        else
                        {
                            if (item.Text.Equals(""))
                            {

                            }
                            else
                            {
                                lv_Items.Items.Add(items[w]);
                            }

                        }
                    }

                    ++_Ids;
                }

                EclatAlgorithm();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<Script>alert('No Training Dataset Found!!!')</script>");
            }

            connExcel.Close();
        }               

    }
}