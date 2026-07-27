from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization


private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048
)

with open("rsa_key.p8", "wb") as f:
    f.write(
        private_key.private_bytes(
            serialization.Encoding.PEM,
            serialization.PrivateFormat.PKCS8,
            serialization.NoEncryption()
        )
    )

public_key = private_key.public_key()

with open("rsa_key.pub", "wb") as f:
    f.write(
        public_key.public_bytes(
            serialization.Encoding.PEM,
            serialization.PublicFormat.SubjectPublicKeyInfo
        )
    )

print("Keys generated")