# SSH Key Generator Script

This script simplifies the process of generating an SSH key, updating the SSH config, and adding the key to the SSH agent. It prompts the user for their email and domain, making it easy to set up SSH keys for different domains.

## Usage

1. Make sure you have [Git](https://git-scm.com/) installed on your machine.

2. Clone the repository:

    ```bash
    git clone https://github.com/jaestebang/ssh-key-generator-script.git
    ```

3. Navigate to the script directory:

    ```bash
    cd ssh-key-generator-script
    ```

4. Run the script:

    ```bash
    ./generate-ssh-key.sh
    ```

5. Follow the prompts to enter your email and domain.

6. The script will generate an SSH key, update the SSH config, display the public key, and add the private key to the SSH agent.

## Script Details

- The generated SSH key will be saved as `~/.ssh/id_rsa_<email_sanitized>`.
- The SSH config will have an entry for the provided domain.
- The public key will be displayed, and you can copy it for use in platforms like GitHub or GitLab.

## Requirements

- Bash (Linux/Mac) or Git Bash (Windows)
- [Git](https://git-scm.com/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
