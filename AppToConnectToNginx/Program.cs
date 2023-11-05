using Microsoft.AspNetCore.HttpOverrides;

var builder = WebApplication.CreateBuilder();

var app =  builder.Build();

app.UseForwardedHeaders(new ForwardedHeadersOptions
{
    ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
});

app.MapGet("/", () => "Hello, do you remember me?");

app.Run();