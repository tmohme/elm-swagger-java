package org.mohme.esj.api;

import org.mohme.esj.model.Pet;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;

@RestController
public class Pets implements PetsApi {

    @Override
    public ResponseEntity<List<Pet>> findPets() {
        return ResponseEntity.ok().body(Collections.emptyList());
    }
}
