location_folder = "/Users/sjifradeleeuw/GitHub/" # change location

data_dir = paste0(location_folder, "Replication-Code-Democratic-Support-And-Left-Right-Dimension/Data/") # do not change
fig_dir = paste0(location_folder, "Replication-Code-Democratic-Support-And-Left-Right-Dimension/Output/Figures/") # do not change
tab_dir = paste0(location_folder, "Replication-Code-Democratic-Support-And-Left-Right-Dimension/Output/Tables/")
robust_dir = paste0(location_folder, "Replication-Code-Democratic-Support-And-Left-Right-Dimension/Output/Appendices/") # do not change

# import data
df = read.csv(paste0(data_dir, "wvs-merged.csv"))
country_data = read.csv(paste0(data_dir, "authors-country_data.csv"))
vdem = read.csv(paste0(data_dir, "vdem-country_year.csv"))
vdem_agg = read.csv(paste0(data_dir, "vdem-regime_characteristics.csv"))

# define measurement levels
df = data.frame(
       sapply(subset(df, select = c("country", "survey", "year", "gndr", "educ", "native", "relig", "sex",
              "legacy","wave", "age_cat", "exposure_age", "exp")), factor), 
       sapply(subset(df, select = c("dap_strongleader", "dap_army", "dap_dem", "dap_economy", "autdem",
              "dap_indecisive", "dap_order", "dap_better", "lrscale", "prox", 
              "birth", "age", "age_5", "age_18", "exposure", "polint", "nat1", "nat2", "nat3", "nat4", "nat5", "nat",
              "socpol1", "socpol2", "socpol3", "socpol", "inceq", "lib1", "lib2", "lib3", "lib", 
              "equality1", "equality2", "equality3", "equality", "weight", "weight_split", "weight2", "weight2_split", 
              "sampsize", "lb", "ub", "corr", "startyear", "endyear", "duration", "indoc_mean",
              "repr_mean", "indoc_max", "repr_max", "indoctrination_r", "repression_r")), as.numeric))

df = subset(df, !is.na(autdem) & !is.na(lrscale))