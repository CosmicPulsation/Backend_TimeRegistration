namespace TimeRegistration.Client.Pages;

partial class Home
{
    bool Bigin { get; set; } = false;

    string Status => Bigin ? "Working" : "Stopt";
    public void onBiginTimeRegistration()
    {
        Bigin = true;
    }
}
