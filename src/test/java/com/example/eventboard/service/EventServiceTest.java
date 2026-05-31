package com.example.eventboard.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class EventServiceTest {

    @Test
    void testFreeSeatsCalculation() {

        int maxSeats = 20;
        int registeredParticipants = 8;

        int freeSeats =
                maxSeats - registeredParticipants;

        assertEquals(12, freeSeats);
    }
}