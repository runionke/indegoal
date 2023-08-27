# indegoal

This is a starter project to show basic functionality of Flutter, Riverpod and Appwrite.

The application itself is to track and report on the usage of the Indego Exoskeleton. In September of 2020, I was hit by a reckless driver and paralyzed from chest down, sustaining a T3 spinal cord injury. As a US veteran, I was fortunate in being given the opportunity to receive an Indego Exoskeleton, which has many benefits for both physical and mental health for someone with a spinal cord injury. As part of the processes for receiving this equipment you must use and document its use over an initial trial period. I wanted to create an easy to use app that might be of benefit to others who will be going through this process with the VA, and for after to help stay motivated and continue to track their progress.

## Running this project

Freezed and Riverpod depend on code generation.
In the terminal, run the following command from the project root directory:
dart run build_runner watch -d

## Auth redirect

During authentication this project is set to redirect to the indegoal.com
root url. After you've authenticated you can close that window and return to original localhost tab, which will have the updated session.
