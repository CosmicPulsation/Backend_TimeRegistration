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
    [Fact]
    public void FailingTest()
    {
        // Act
        bool test = false;

        // Assert
        test.Should().BeTrue();

    }
}
