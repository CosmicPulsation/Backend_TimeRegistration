using FluentAssertions;

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
}
