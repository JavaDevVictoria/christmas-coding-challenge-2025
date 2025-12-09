package com.app.jobportal;

import com.app.jobportal.model.Job;

import jakarta.annotation.PostConstruct;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;


@RestController
public class JobController {

    private ArrayList<Job> jobsList;

    @GetMapping("/")
    public String listJobs() {
        return "<h1>Here are the list of jobs</h1>";
    }

    @PostConstruct
    public void init() {
        Job job1 = new Job("1", "Software Engineer", "Develop software applications", LocalDate.now());
        Job job2 = new Job("2", "Data Scientist", "Analyze data and develop models", LocalDate.now());
        jobsList = new ArrayList<Job>();
        jobsList.add(job1);
        jobsList.add(job2);
    }

    @GetMapping("/jobs")
    public ArrayList<Job> getJobs() {
        for(Job job: jobsList) {
            job.setLastAccessDate(LocalDateTime.now());
            job.addNumViews();
        }
        return jobsList;
    }
	
	@GetMapping("/jobs/search/{query}")
    public ArrayList<Job> searchJobs(@PathVariable String query) {
        ArrayList<Job> matchingJobs = new ArrayList<>();
        for (Job job : jobsList) {
            if (job.getTitle().toLowerCase().contains(query.toLowerCase()) ||
                job.getDescription().toLowerCase().contains(query.toLowerCase())) {
                matchingJobs.add(job);
            }
        }
        return matchingJobs;
    }
}