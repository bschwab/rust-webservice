#[macro_use] extern crate nickel;

use nickel::{Nickel, MediaType};

fn main() {

    let mut server = Nickel::new();

    server.utilize(router! {
        get "/status" => |_request, mut response| {
            response.set(MediaType::Json);
            r#"{ "status": "Ok" }"#
        }
    });

    server.listen("0.0.0.0:6000").unwrap();
}

#[cfg(test)]
mod tests {

    #[test]
    fn dummy_test() {
        let dummy = 5;
        assert_eq!(5, dummy);
    }
}
