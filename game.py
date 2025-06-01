import random

def get_valid_difficulty_level():
    """
    Prompts the user to choose a valid difficulty level.

    Returns:
        int: The chosen difficulty level (1, 2, or 3).
    """
    difficulty_level = int(input("Please choose difficulty level:\n" +
                                 "1. Easy (13 max attempts)\n" +
                                 "2. Medium (10 max attempts)\n" +
                                 "3. Hard (7 max attempts)\n"))
    while difficulty_level < 1 or difficulty_level > 3:
        difficulty_level = int(input("Invalid number, please choose a VALID difficulty level 1-3:\n" +
                                     "1. Easy (13 max attempts)\n" +
                                     "2. Medium (10 max attempts)\n" +
                                     "3. Hard (7 max attempts)\n"))
    return difficulty_level

def calculate_amount_of_guesses(difficulty_level):
    """
    Calculates the amount of guesses based on the difficulty level.

    Args:
        difficulty_level (int): The chosen difficulty level.

    Returns:
        int: The number of maximum attempts allowed.
    """
    if difficulty_level == 1:
        return 13
    elif difficulty_level == 2:
        return 10
    else:
        return 7

def generate_computer_number():
    """
    Generates a unique random number between 1000 and 9999.

    Returns:
        int: The unique random number generated.
    """
    while True:
        random_number = random.randint(1000, 9999)
        print(random_number)
        if is_number_unique(random_number):
            return random_number

def is_number_unique(num):
    """
    Checks if a number has all unique digits.

    Args:
        num (int): The number to check.

    Returns:
        bool: True if the number has all unique digits, False otherwise.
    """
    digits_array = [False] * 10
    while num > 0:
        digit = num % 10
        if not digits_array[digit]:
            digits_array[digit] = True
            num //= 10
        else:
            return False
    return True

def get_valid_guess():
    """
    Prompts the user to enter a valid guess (4-digit unique number).

    Returns:
        int: The valid guess entered by the user.
    """
    while True:
        guess = int(input("Please enter a VALID guess: "))
        if is_number_unique(guess) and 999 < guess < 10000:
            return guess

def calculate_amount_of_hits(computer_number, user_guess):
    """
    Calculates the number of hits (correct digits in correct positions)
    between the computer number and user guess.

    Args:
        computer_number (int): The computer-generated number.
        user_guess (int): The user's guess.

    Returns:
        int: The number of hits.
    """
    hits = 0
    while computer_number > 0 or user_guess > 0:
        computer_number_digit = computer_number % 10
        user_guess_digit = user_guess % 10
        if computer_number_digit == user_guess_digit:
            hits += 1
        computer_number //= 10
        user_guess //= 10
    return hits

def calculate_amount_of_near_miss(computer_number, user_guess):
    """
    Calculates the number of near misses (correct digits in wrong positions)
    between the computer number and user guess.

    Args:
        computer_number (int): The computer-generated number.
        user_guess (int): The user's guess.

    Returns:
        int: The number of near misses.
    """
    near_miss = 0
    computer_number_array = []
    user_guess_array = []
    while computer_number > 0:
        computer_number_digit = computer_number % 10
        computer_number_array.append(computer_number_digit)
        computer_number //= 10
    while user_guess > 0:
        user_guess_digit = user_guess % 10
        user_guess_array.append(user_guess_digit)
        user_guess //= 10
    for i in range(len(computer_number_array)):
        if user_guess_array[i] in computer_number_array and user_guess_array[i] != computer_number_array[i]:
            near_miss += 1
    return near_miss

difficulty_level = get_valid_difficulty_level()
amount_of_guesses = calculate_amount_of_guesses(difficulty_level)
computer_number = generate_computer_number()
is_user_won = False
round = 0

while not is_user_won and round < amount_of_guesses:
    user_guess = get_valid_guess()
    if user_guess == computer_number:
        print("Yay!! You won!!")
        is_user_won = True
    else:
        amount_of_hits = calculate_amount_of_hits(computer_number, user_guess)
        amount_of_near_miss = calculate_amount_of_near_miss(computer_number, user_guess)
        print(f"Hits: {amount_of_hits} Near miss: {amount_of_near_miss}")
    round += 1

if not is_user_won:
    print(f"Oh.. you failed... the number was {computer_number}")