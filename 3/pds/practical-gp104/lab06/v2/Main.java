package v2;

import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Person writer = new Person("Dennis", 40);
        Place place = new Place("America", "USA");
        Movie myMovie = new Movie.MovieBuilder("Dune 2", 2024)
                .director(writer)
                .genres(Arrays.asList("Action", "Sci-fi", "Drama"))
                .languages(List.of("English"))
                .writer(writer)
                .isTelevision(false)
                .locations(List.of(place))
                .build();
        System.out.println(myMovie);
    }
}
