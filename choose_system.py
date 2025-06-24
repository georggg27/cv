import hashlib

def choose_system(name: str) -> str:
    """Chooses a Linux distribution based on the hash of a name."""
    systems = ["ubuntu:20.04", "ubuntu:22.04", "debian:11", "debian:12"]
    hex_digest = hashlib.sha256(name.encode('utf-8')).hexdigest()
    hash_as_int = int(hex_digest, 16)
    choice_index = hash_as_int % len(systems)
    return systems[choice_index]

if __name__ == '__main__':
    full_name = "Тхостов Георгий"
    chosen_system = choose_system(full_name)
    print(f"Для студента {full_name} выбрана система: {chosen_system}")