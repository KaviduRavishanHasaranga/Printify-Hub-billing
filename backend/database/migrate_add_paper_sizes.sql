-- Migration: Add paper_sizes column to orders table
-- Run this on your production database if the column is missing

ALTER TABLE orders
  ADD COLUMN IF NOT EXISTS paper_sizes JSONB DEFAULT NULL;
