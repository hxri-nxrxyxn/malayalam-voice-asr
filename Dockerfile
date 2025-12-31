FROM ghcr.io/ggerganov/whisper.cpp:main

# Set working directory
WORKDIR /app

# Copy the custom web interface
COPY public /app/public

# Expose the server port
EXPOSE 8080

# Set the entrypoint to the whisper-server binary
ENTRYPOINT ["/app/build/bin/whisper-server"]

# Default command:
# -m: Path to the model (mounted via volume)
# --host: Listen on all interfaces
# --port: Server port
# --public: Path to static files
# -t: Number of threads (optimized for 4 cores/8 threads as discussed)
CMD ["-m", "/models/ggml-model-q4_0.bin", "--host", "0.0.0.0", "--port", "8080", "--public", "/app/public", "-t", "4"]
