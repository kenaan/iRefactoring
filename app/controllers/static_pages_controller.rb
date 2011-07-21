class StaticPagesController < ApplicationController
  def test
    @text = %Q{TY  - JOUR
AU  - Gomersall, Charles
PY  - 2010
IS  - 2
M3  - 10.1186/cc8871
SP  - 131
T1  - Critical care in the developing world - a challenge for us all
JO  - Critical Care
UR  - http://ccforum.com/content/14/2/131
VL  - 14
N1  - See related review by Du et al., http://ccforum.com/content/14/1/206
SN  - 1364-8535
N2  - 




            The rapid economic growth in parts of the developing world is being accompanied by an expansion of critical care. Hurdles to expansion include lack of critical care training for healthcare workers. This is coupled with a need for a huge number of healthcare workers due to the high populations of countries such as China and India. Intensivists in the developed world can and should help.


ER  - 
TY  - JOUR
AU  - Joubert, Bonnie
AU  - Lange, Ethan
AU  - Franceschini, Nora
AU  - Mwapasa, Victor
AU  - North, Kari
AU  - Meshnick, Steven
AU  - the NIAID Center for HIV/AIDS Vaccine Immunology
PY  - 2010
IS  - 3
M3  - 10.1186/gm138
SP  - 17
T1  - A whole genome association study of mother-to-child transmission of HIV in Malawi
JO  - Genome Medicine
UR  - http://genomemedicine.com/content/2/3/17
VL  - 2
SN  - 1756-994X
N2  - 






BACKGROUND:

More than 300,000 children are newly infected with HIV each year, predominantly through mother-to-child transmission (HIV MTCT). Identification of host genetic traits associated with transmission may more clearly explain the mechanisms of HIV MTCT and further the development of a vaccine to protect infants from infection. Associations between transmission and a selection of genes or single nucleotide polymorphisms (SNP)s may give an incomplete picture of HIV MTCT etiology. Thus, this study employed a genome-wide association approach to identify novel variants associated with HIV MTCT.



METHODS:

We conducted a nested case-control study of HIV MTCT using infants of HIV(+) mothers, drawn from a cohort study of malaria and HIV in pregnancy in Blantyre, Malawi. Whole genome scans (650,000 SNPs genotyped using Illumina genotyping assays) were obtained for each infant. Logistic regression was used to evaluate the association between each SNP and HIV MTCT.



RESULTS:

Genotype results were available for 100 HIV(+) infants (at birth, 6, or 12 weeks) and 126 HIV(-) infants (at birth, 6, and 12 weeks). We identified 9 SNPs within 6 genes with a P-value < 5 x 10-5 associated with the risk of transmission, in either unadjusted or adjusted by maternal HIV viral load analyses. Carriers of the rs8069770 variant allele were associated with a lower risk of HIV MTCT (odds ratio = 0.27, 95% confidence interval = 0.14, 0.51), where rs8069770 is located within HS3ST3A1, a gene involved in heparan sulfate biosynthesis. Interesting associations for SNPs located within or near genes involved in pregnancy and development, innate immunological response, or HIV protein interactions were also observed.



CONCLUSIONS:

This study used a genome-wide approach to identify novel variants associated with the risk of HIV MTCT in order to gain new insights into HIV MTCT etiology. Replication of this work using a larger sample size will help us to differentiate true positive findings.



ER  - }
    render :content_type => "text/plain", :text => @text
  end
  
  def test2
    @text =  %Q{TY  - JOUR
AU  - George, Stacey
AU  - Hayes, Allison
AU  - Chen, Celia
AU  - Crotty, Maria
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2377-11-87
SP  - 87
T1  - The effect of static scanning and mobility training on mobility in people with hemianopia after stroke: a randomized controlled trial comparing standardized versus non-standardized treatment protocols
JO  - BMC Neurology
UR  - http://www.biomedcentral.com/1471-2377/11/87
VL  - 11
SN  - 1471-2377
ER  - 
TY  - JOUR
AU  - Zhang, Li
AU  - Yin, Jikai
AU  - Duan, Yunyou
AU  - Yang, Yilin
AU  - Yuan, Lijun
AU  - Cao, Tiesheng
PY  - 2011
IS  - 1
M3  - 10.1186/1471-230X-11-84
SP  - 84
T1  - Assessment of intrahepatic blood flow by Doppler ultrasonography: relationship between the hepatic vein, portal vein, hepatic artery and portal pressure measured intraoperatively in patients with portal hypertension
JO  - BMC Gastroenterology
UR  - http://www.biomedcentral.com/1471-230X/11/84
VL  - 11
SN  - 1471-230X
ER  - 
TY  - JOUR
AU  - Toy, Elaine
AU  - Balasubramanian, Sripriya
AU  - Selmi, Carlo
AU  - Li, Chin-Shang
AU  - Bowlus, Christopher
PY  - 2011
IS  - 1
M3  - 10.1186/1471-230X-11-83
SP  - 83
T1  - The Prevalence, Incidence and Natural History of Primary Sclerosing Cholangitis in an Ethnically Diverse Population
JO  - BMC Gastroenterology
UR  - http://www.biomedcentral.com/1471-230X/11/83
VL  - 11
SN  - 1471-230X
ER  - 
TY  - JOUR
AU  - Mekontso Dessap, Armand
AU  - Ouanes, Islem
AU  - Rana, Nerlep
AU  - Borghi, Beatrice
AU  - Bazin, Christophe
AU  - Katsahian, Sandrine
AU  - Hulin, Anne
AU  - Brun-Buisson, Christian
PY  - 2011
IS  - 4
M3  - 10.1186/cc10317
SP  - R171
T1  - Effects of discontinuing or continuing ongoing statin therapy in severe sepsis and septic shock: a retrospective cohort study
JO  - Critical Care
UR  - http://ccforum.com/content/15/4/R171
VL  - 15
SN  - 1364-8535
ER  - 
TY  - JOUR
AU  - Matukala Nkosi, Thomas
AU  - Parent, Marie-Elise
AU  - Siemiatycki, Jack
AU  - Pintos, Javier
AU  - Rousseau, Marie-Claude
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2288-11-108
SP  - 108
T1  - Comparison of indicators of material circumstances in the context of an epidemiological study
JO  - BMC Medical Research Methodology
UR  - http://www.biomedcentral.com/1471-2288/11/108
VL  - 11
SN  - 1471-2288
ER  - 
TY  - JOUR
AU  - Peloso, Paul
AU  - Gammaitoni, Arnold
AU  - Smugar, Steven
AU  - Wang, Hongwei
AU  - Moore, R Andrew
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2474-12-165
SP  - 165
T1  - Longitudinal Numbers-Needed-To-Treat (NNT) For Achieving Various Levels of Analgesic Response and Improvement with Etoricoxib, Naproxen, and Placebo in Ankylosing Spondylitis
JO  - BMC Musculoskeletal Disorders
UR  - http://www.biomedcentral.com/1471-2474/12/165
VL  - 12
SN  - 1471-2474
ER  - 
TY  - JOUR
AU  - Dicko, Alassane
AU  - Toure, Sidy
AU  - Traore, Mariam
AU  - Sagara, Issaka
AU  - Toure, Ousmane
AU  - Sissoko, Mahamadou
AU  - Diallo, Alpha
AU  - Rogier, Christophe
AU  - Salamon, Roger
AU  - de Sousa, Alexandra
AU  - Doumbo, Ogobara
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2458-11-573
SP  - 573
T1  - Increase in EPI vaccines coverage after implementation of intermittent preventive treatment of malaria in infant with Sulfadoxine -pyrimethamine in the district of Kolokani, Mali: Results from a cluster randomized control trial
JO  - BMC Public Health
UR  - http://www.biomedcentral.com/1471-2458/11/573
VL  - 11
SN  - 1471-2458
ER  - 
TY  - JOUR
AU  - Mitsouras, Katherine
AU  - Faulhaber, Erica
AU  - Hui, Gordon
AU  - Joslin, Janis
AU  - Eng, Curtis
AU  - Barr, Margaret
AU  - Irizarry, Kristopher
PY  - 2011
IS  - 1
M3  - 10.1186/1746-6148-7-38
SP  - 38
T1  - Development of a PCR Assay to Detect Papillomavirus Infection in the Snow Leopard
JO  - BMC Veterinary Research
UR  - http://www.biomedcentral.com/1746-6148/7/38
VL  - 7
SN  - 1746-6148
ER  - 
TY  - JOUR
AU  - Bajgain, Prabin
AU  - Richardson, Bryce
AU  - Price, Jared
AU  - Cronn, Richard
AU  - Udall, Joshua
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2164-12-370
SP  - 370
T1  - Transcriptome characterization and polymorphism detection between subspecies of big sagebrush (Artemisia tridentata) 
JO  - BMC Genomics
UR  - http://www.biomedcentral.com/1471-2164/12/370
VL  - 12
SN  - 1471-2164
ER  - 
TY  - JOUR
AU  - Ma, Xiaoxing
AU  - Peterson, Randy
AU  - Turnbull, John
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2202-12-71
SP  - 71
T1  - Adenylyl Cyclase type 3, a marker of primary cilia, is reduced in primary cell culture and in lumbar spinal cord in situ in G93A SOD1 mice
JO  - BMC Neuroscience
UR  - http://www.biomedcentral.com/1471-2202/12/71
VL  - 12
SN  - 1471-2202
ER  - 
TY  - JOUR
AU  - Massilamany, Chandirasegaran
AU  - Upadhyaya, Bijaya
AU  - Gangaplara, Arunakumar
AU  - Kuszynski, Charles
AU  - Reddy, Jay
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2172-12-40
SP  - 40
T1  - Detection of autoreactive CD4 T cells using major histocompatibility complex class II dextramers
JO  - BMC Immunology
UR  - http://www.biomedcentral.com/1471-2172/12/40
VL  - 12
SN  - 1471-2172
ER  - 
TY  - JOUR
AU  - Saski, Christopher
AU  - Li, Zhigang
AU  - Feltus, Frank
AU  - Luo, Hong
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2164-12-369
SP  - 369
T1  - New genomic resources for switchgrass: a BAC library and comparative analysis of homoeologous genomic regions harboring bioenergy traits
JO  - BMC Genomics
UR  - http://www.biomedcentral.com/1471-2164/12/369
VL  - 12
SN  - 1471-2164
ER  - 
TY  - JOUR
AU  - Teruel, Maria
AU  - Martin, Jose-Ezequiel
AU  - Gonzalez-Juanatey, Carlos
AU  - Lopez-Mejias, Raquel
AU  - Miranda-Filloy, Jose
AU  - Blanco, Ricardo
AU  - Balsa, Alejandro
AU  - Pascual-Salcedo, Dora
AU  - Rodriguez-Rodriguez, Luis
AU  - Fernandez-Gutierrez, Benjamin
AU  - Ortiz, Ana
AU  - Gonzalez-Alvaro, Isidoro
AU  - Gomez-Vaquero, Carmen
AU  - Bottini, Nunzio
AU  - Llorca, Javier
AU  - Gonzalez-Gay, Miguel
AU  - Martin, Javier
PY  - 2011
IS  - 4
M3  - 10.1186/ar3401
SP  - R116
T1  - Association of acid phosphatase locus 1*C allele with the risk of cardiovascular events in rheumatoid arthritis patients
JO  - Arthritis Research & Therapy
UR  - http://arthritis-research.com/content/13/4/R116
VL  - 13
SN  - 1478-6354
ER  - 
TY  - JOUR
AU  - Huijts, Petra
AU  - van Dongen, Minka
AU  - de Goeij, Moniek
AU  - van Moolenbroek, Adrian
AU  - Blanken, Freek
AU  - Vreeswijk, Maaike
AU  - de Kruijf, Esther
AU  - Mesker, Wilma
AU  - van Zwet, Erik
AU  - Tollenaar, Rob
AU  - Smit, Vincent
AU  - van Asperen, Christi
AU  - Devilee, Peter
PY  - 2011
IS  - 4
M3  - 10.1186/bcr2917
SP  - R72
T1  - Allele-Specific regulation of FGFR2 expression is cell type-dependent and may increase breast cancer risk through a paracrine stimulus involving FGF10
JO  - Breast Cancer Research
UR  - http://breast-cancer-research.com/content/13/4/R72
VL  - 13
SN  - 1465-5411
ER  - 
TY  - JOUR
AU  - Yang, Cui Bo
AU  - Zheng, Yu Ting
AU  - Kiser, Paul
AU  - Mower, George
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2202-12-70
SP  - 70
T1  - Identification of alpha-Chimaerin as a Candidate Gene for Critical Period Neuronal Plasticity in Cat and Mouse Visual Cortex
JO  - BMC Neuroscience
UR  - http://www.biomedcentral.com/1471-2202/12/70
VL  - 12
SN  - 1471-2202
ER  - 
TY  - JOUR
AU  - Owusu-Dabo, Ellis
AU  - Lewis, Sarah
AU  - McNeill, Ann
AU  - Gilmore, Anna
AU  - Britton, John
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2458-11-572
SP  - 572
T1  - Support for smoke-free policy, and awareness of tobacco health effects and use of smoking cessation therapy in a developing country
JO  - BMC Public Health
UR  - http://www.biomedcentral.com/1471-2458/11/572
VL  - 11
SN  - 1471-2458
ER  - 
TY  - JOUR
AU  - Crease, Teresa
AU  - Floyd, Robin
AU  - Cristescu, Melania
AU  - Innes, David
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2148-11-212
SP  - 212
T1  - Evolutionary factors affecting Lactate dehydrogenase A and B variation in the Daphnia pulex species complex.
JO  - BMC Evolutionary Biology
UR  - http://www.biomedcentral.com/1471-2148/11/212
VL  - 11
SN  - 1471-2148
ER  - 
TY  - JOUR
AU  - Zaragosi, Laure-Emmanuelle
AU  - Wdziekonski, Brigitte
AU  - Le Brigand, Kevin
AU  - Villageois, Phi
AU  - Mari, Bernard
AU  - Waldmann, Rainer
AU  - Dani, Christian
AU  - Barbry, Pascal
PY  - 2011
IS  - 7
M3  - 10.1186/gb-2011-12-7-r64
SP  - R64
T1  - Small RNA sequencing reveals miR-642a-3p as a novel adipocyte-specific microRNA and miR-30 as a key regulator of human adipogenesis
JO  - Genome Biology
UR  - http://genomebiology.com/2011/12/7/R64
VL  - 12
SN  - 1465-6906
ER  - 
TY  - JOUR
AU  - Hayase, Tamaki
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2210-11-6
SP  - 6
T1  - Differential effects of TRPV1 receptor ligands against nicotine-induced depression-like behaviors
JO  - BMC Pharmacology
UR  - http://www.biomedcentral.com/1471-2210/11/6
VL  - 11
SN  - 1471-2210
ER  - 
TY  - JOUR
AU  - Toelle, Angelika
AU  - Suhail, Saba
AU  - Jung, Monika
AU  - Jung, Klaus
AU  - Stephan, Carsten
PY  - 2011
IS  - 1
M3  - 10.1186/1471-2407-11-302
SP  - 302
T1  - Fatty acid binding proteins (FABPs) in prostate, bladder, and kidney cancer cell lines and the use of IL-FABP as survival predictor in patients with renal cell carcinoma
JO  - BMC Cancer
UR  - http://www.biomedcentral.com/1471-2407/11/302
VL  - 11
SN  - 1471-2407
ER  - }
    render :content_type => "text/plain", :text => @text
  end
  
  def test3
    render :content_type => "text/plain", :text => ""
  end
end