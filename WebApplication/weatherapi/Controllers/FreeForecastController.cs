using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace weatherapi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class FreeForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public FreeForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetFreeWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
                {
                    Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
                    TemperatureC = Random.Shared.Next(-20, 55),
                    Summary = $"[Free] {Summaries[Random.Shared.Next(Summaries.Length)]}"
                })
                .ToArray();
        }
    }
}
