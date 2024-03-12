using Bunit;
using FluentAssertions;
using TimeRegistration.Client.Pages;

namespace TimeRegistration.Client.Test.Unit;
public class Test
{
    [Fact]
    public void SucitingTest()
    {
        // Act
        bool test = true;

        // Assert
        test.Should().BeTrue();
    }

    [Fact]
    public void Homepage()
    {
        // Arrage
        TestContext context = new();
        var render = context.RenderComponent<Home>();
        var button = render.Find("[data-testid=\"bigin time registration\"]");

        // Act
        button.Click();

        // Assert
        var Status = render.Find("[data-testid=\"Status indicator\"]");
        Status.TextContent.Should().BeEquivalentTo("Status: Working");
    }
}
