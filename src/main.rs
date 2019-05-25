#[macro_use] extern crate nickel;

use nickel::{Nickel, MediaType};

fn main() {

    let mut server = Nickel::new();

    server.utilize(router! {
        get "/status" => |_request, mut response| {
            response.set(MediaType::Json);
            r#"{ "status": "ok" }"#
        }
    });

    server.listen("127.0.0.1:6000");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dummy_test() {
        let dummy = 5;
        assert_eq!(5, dummy);
    }
}
