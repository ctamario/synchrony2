


###
library(pacman)

p_load(dplyr)

# load raw df
raw_df <- read.csv(file = "C:/data/rawdata/rawdata_20220707.csv", sep = ";", dec = ",")

str(raw_df)

# create a site file with number of samplings
df_aggr <- raw_df %>% group_by(XKOORLOK, YKOORLOK, s99tm_n, s99tm_e) %>% summarize(n_samples = n(), ÖringTOT_mean = mean(ÖringTOT_mean)) %>% filter(n_samples > 9)

hist(df_aggr$n_samples)

write.table(df_aggr, "C:/data/rawdata/SERS_sites_20220707.csv", sep = ";", dec = ",", row.names = F)


test_sites <- data.frame(XKOORLOK1 = NULL, YKOORLOK1 = NULL,
                         XKOOLOK2 = NULL, YKOORLOK2 = NULL,
                         Atgardsid = NULL, fishway_year = NULL)

test_sites <- rbind(test_sites, data.frame(XKOORLOK1 = 639232, YKOORLOK1 = 128506,
                                           XKOORLOK2 = 639235, YKOORLOK2 = 128585,
                                           Atgardsid = 4635, fishway_year = 2016))

test_sites <- rbind(test_sites, data.frame(XKOORLOK1 = 639232, YKOORLOK1 = 128506,
                                           XKOORLOK2 = 639235, YKOORLOK2 = 128585,
                                           Atgardsid = 4635, fishway_year = 2016))



###
###

raw_df %>% filter(XKOORLOK == test_sites$XKOORLOK1[1], YKOORLOK == test_sites$YKOORLOK1[1]) %>% select(year_mean, ÖringTOT_mean)
raw_df %>% filter(XKOORLOK == test_sites$XKOORLOK2[1], YKOORLOK == test_sites$YKOORLOK2[1]) %>% select(year_mean, ÖringTOT_mean)








