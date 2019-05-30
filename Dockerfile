FROM rust:latest

WORKDIR /usr/src/myapp

COPY . .

RUN cargo build --release

RUN cargo install --path .

EXPOSE 6000

CMD ["/usr/local/cargo/bin/myapp"]
