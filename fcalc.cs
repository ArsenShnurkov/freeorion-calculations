using System;
using System.IO;
using System.Configuration;

public class fcalc
{
	public static string GetSaveDirectory()
	{
		string directory = ConfigurationManager.AppSettings["directory"];
		string datadir = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
		// https://stackoverflow.com/questions/623333/pathcanonicalize-equivalent-in-c-sharp
		string home = Directory.GetParent(datadir).FullName;
		Console.WriteLine(home);
		directory = directory.Replace("~", home);
		return directory;
	}
	public static int Main(string[] args)
	{
		Console.WriteLine($"{GetSaveDirectory()}");
		return 0;
	}
}
