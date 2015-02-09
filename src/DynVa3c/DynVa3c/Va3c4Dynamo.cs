using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Revit & Dynamo 
using Autodesk.Revit.DB;
using Autodesk.Revit.DB.Analysis;
using Autodesk.Revit.UI;
using DSCore;
using Dynamo.Models;
using Dynamo.Nodes;
using Dynamo.Utilities;
using ProtoCore.AST.AssociativeAST;
using RevitServices.Persistence;
using RevitServices.Transactions;
using ProtoCore;
using ProtoCore.Utils;
using Autodesk.DesignScript.Runtime;
using System.IO;

namespace DynVa3c
{
    public class Va3c4Dynamo
    {

        public static void ExportVa3c(string filename)
        {
            // 1. Get active document 3d view
            //local variables
            Document RvtDoc = DocumentManager.Instance.CurrentUIApplication.ActiveUIDocument.Document;

            // 2. Call ExportView3D from RvtVac3
            //RvtVa3c.Command.ExportView3D(RvtDoc.ActiveView as View3D, filename);

            //AppDomain.CurrentDomain.AssemblyResolve += CurrentDomain_AssemblyResolve;

            Va3cExportContext context = new Va3cExportContext(RvtDoc, filename);

            CustomExporter exporter = new CustomExporter(RvtDoc, context);

            exporter.IncludeFaces = false;

            exporter.ShouldStopOnError = false;


            try
            {
                exporter.Export(RvtDoc.ActiveView as View3D);
            }
            catch (Exception) // Autodesk.Revit.Exceptions.ExternalApplicationException
            {

                //throw;
            }

            string test = context.myjs;

            System.IO.File.WriteAllText(filename, test);
            // 3. Return Report
            //return test;

        }

        private Va3c4Dynamo() { }
    }
}
