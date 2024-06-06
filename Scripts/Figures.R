################################################################################
# Title: Manuscript Figures
# Author: Katelynn Warner 
# Date: 06/05/24
################################################################################

################################################################################
# Cyanobacteria Gene Abundance by Beach Site
################################################################################

Fig <- Cyano_g %>%
  filter(Site_Code != "LB") %>%
  mutate(genus = if_else(genus %in% Cyano_g_top$genus, genus, "Other")) %>%
  ggplot(aes(x=Date, y=Abundance/.5, group=genus, fill=genus)) +
  geom_bar(stat = "identity", position = "stack")+
  theme_classic() +
  #theme(legend.position = "none") +
  facet_wrap(~`Site`, nrow = 2, ncol=1) +
  ylab("Gene Abundance / L")


tiff("DiversityFig.tiff", width = 5, height = 5, units = "in", res = 600, bg = "white")

Fig

dev.off()

###############################################################################
# Microcystis Gene Count vs. Microcystin (ELISA)
###############################################################################

Fig2 = Cyano_g %>%
  filter(genus == "Microcystis") %>%
  #na.omit() %>%
  ggplot(aes(x=Concentration, y=Abundance/.5, color=Site)) +
  geom_point(size=3, alpha=0.5) +
  theme_classic() +
  ylab("Microcystis Gene Abundance / L") +
  xlab("Microcystin Concentration (ug/L)") +
  scale_color_manual(values = c("dodgerblue3", "turquoise4", "aquamarine3"))

tiff("MC_Microcystis.tiff", width = 6, height = 4, units = "in", res = 600, bg = "white")

Fig2

dev.off()

