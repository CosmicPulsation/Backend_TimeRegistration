using Microsoft.JSInterop;

namespace TimeRegistration.Client.Services;

public class GeolocationService
{
    private Task<IJSObjectReference> module {  get; init; }

    public GeolocationService(IJSRuntime jsRuntime)
    {
        module = jsRuntime.InvokeAsync<IJSObjectReference>("import", "./_content/TimeRegistration.Client/Services/GeolocationService.cs.js").AsTask();
    }

    public async Task GetGeolocationAsync()
    {
        var test = await (await module).InvokeAsync<(double, double)>("GetGeolocation");
    }
}
