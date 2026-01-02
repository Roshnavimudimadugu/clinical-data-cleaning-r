library(dplyr)
library(readr)

raw_data <- read_csv("data/raw_clinical_data.csv")

clean_data <- raw_data %>%
  filter(!is.na(patient_id)) %>%
  mutate(
    age = as.numeric(age),
    visit_date = as.Date(visit_date)
  ) %>%
  distinct()

write_csv(clean_data, "outputs/cleaned_data.csv")
