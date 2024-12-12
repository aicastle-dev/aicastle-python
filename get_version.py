import os

# 버전을 aicastle/__init__.py에서 읽어옴
def read_version():
    version_file = os.path.join('aicastle', '__init__.py')
    with open(version_file, 'r') as f:
        for line in f:
            if line.startswith('__version__'):
                delim = '"' if '"' in line else "'"
                version = line.split(delim)[1]
                print(version)
                return version
    raise RuntimeError("Unable to find version string.")


if __name__ == "__main__":
    read_version()