"""A simple Python script that adds two numbers."""

def add(a: int, b: int) -> int:
    """Return the sum of two integers."""
    return a + b


def main() -> None:
    """Main function to demonstrate add()."""
    result = add(3, 5)
    print(f"The sum is: {result}")


if __name__ == "__main__":
    main()
