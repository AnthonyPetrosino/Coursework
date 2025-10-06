using Microsoft.JSInterop;

namespace BlazorAuth.Services;

public class AuthService
{
    private readonly IJSRuntime _jsRuntime;
    public bool IsAuthenticated { get; private set; }

    public AuthService(IJSRuntime jsRuntime)
    {
        _jsRuntime = jsRuntime;
    }

    public async Task<bool> CheckAuthAsync()
    {
        var cookieValue = await _jsRuntime.InvokeAsync<string>("eval", "document.cookie.split('; ').find(row => row.startsWith('auth='))?.split('=')[1] || ''");
        IsAuthenticated = cookieValue == "true";
        return IsAuthenticated;
    }

    public async Task<bool> LoginAsync(string username, string password)
    {
        if (username == "admin" && password == "325pwd")
        {
            IsAuthenticated = true;
            await _jsRuntime.InvokeVoidAsync("eval", "document.cookie = 'auth=true; path=/'");
            return true;
        }
        return false;
    }
}