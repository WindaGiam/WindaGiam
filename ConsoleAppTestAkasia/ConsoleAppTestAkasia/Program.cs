using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppTestAkasia
{
    class Program
    {
        public static void Main(string[] args)
        {
            var printManager = new PrintManager();
            printManager.PrintFizzBuzz(100);
            Console.ReadLine();
        }
    }
}
