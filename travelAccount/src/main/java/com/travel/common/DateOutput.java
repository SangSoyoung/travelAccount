package com.travel.common;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class DateOutput {
	
	public static void main(String[] args) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/d");

		LocalDate startDate = LocalDate.parse("2021/09/31", formatter);
		LocalDate endDate = LocalDate.parse("2021/10/05", formatter);

		System.out.println(getDatesBetweenTwoDates(startDate, endDate));
		
		List<LocalDate> dates = getDatesBetweenTwoDates(startDate, endDate);
		
		//String firstDate = dates.get(0).toString();
		
		dates.forEach(i -> System.out.println(i));
	}

	public static List<LocalDate> getDatesBetweenTwoDates(LocalDate startDate, LocalDate endDate) {
		int numOfDaysBetween = (int) ChronoUnit.DAYS.between(startDate, endDate);
		return IntStream.iterate(0, i -> i + 1)
        	.limit(numOfDaysBetween)
        	.mapToObj(i -> startDate.plusDays(i))
		.collect(Collectors.toList());
	}
	
}
