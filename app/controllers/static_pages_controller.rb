class StaticPagesController < ApplicationController
  def test
    text = %Q{
      



                                                                     TY  - JOUR
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



                                                                     ER  - 

      
    }
    render :text => text
  end
end