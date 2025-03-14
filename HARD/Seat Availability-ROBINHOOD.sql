SELECT s.seat_number as available_seat1, s.seat_right as available_seat2
FROM theater_seatmap s
JOIN theater_availability a1 ON s.seat_number = a1.seat_number
JOIN theater_availability a2 ON s.seat_right = a2.seat_number
WHERE a1.is_available AND a2.is_available AND s.seat_number < s.seat_right