## SECOORA-AI project notes 

Coastal water levels and predictions using AI - prehaps incorporate into NOAA CLIM project
Contact: Mark Osler (NOAA NOS) - need email mark.osler@noaa.gov ?

ESRI - Pretrained GeoAI models - coastline extraction, waterbody extractions (SAR), mangrove classifications (mangrove and seagrass examples.),  others

Text for Luke (Jan 2023)

Success stories
Outreach


AI workshop Feb 1-2, 2023

Computer vision for AI
Caltech course
https://cv4ecology.caltech.edu/course_details.html 

Spring plan (from Luke on 12/20/22):

    Progress Report additions (Due early Jan)
    Feb 1-2 Acoustics Workshop, FWRI
    Axiom Technical meeting, Post-Acoustics Workshop

        Coralnet Follow-up after Axiom meeting

        Evaluate FWC benthic data for Coralnet

    Any additions to resource document
    April Patagonia pole-to-pole workshop

### Notes from virtual conference on 5/3/23
Attendance: Luke, Tylar, David K, Neil H, Lauren Gentry, Nick A, Kyle Wilcox (Axiom), Lauren Showalter (Axiom), Felimon Gayanillo (TAMU - DMAC for GCOOS), Matt Biddle, Enrique M, Jennifer Dorton (PM), Hassan M (NOAA-IOOS) 

Interface for AI workflows - what do we want to show? 

Intros, Luke showing slides to introduce project

How can we showcase/serve these resources without re-inventing the wheel?

Beta site next year. What should this include?

Ideas: Interface to different data repositories, model zoo, active learning, formatting requirements, available tools, 

Don't want a wall of text or links. Must be maintainable. As partners unpdate links and resources, our site should update.

NH: What would this site do? House/store info? or Process info? 

What we want to come out with today: 
1. What should we call this resource: Digital gateway? Portal? 
2. How best to point people to this resource?

MB: Can this site output to something like OBIS?

Luke: Focused on annotated data. Not necessarily occurences. What will a user get back? - would be useful to get counts.

Felimon: What is SECOORA infrastructure like? Storage? GPUs? How much will be allocated for this project?

Kyle: Everyone is doing their own thing. Let's put together a streamlined common workflow for the ocean community. Talking about infrastructure is premature.

Tylar: Will all these items be on this resource? Training data, pipelines, etc are a lot of items. 

Kyle: We are not plannng to host infrastructure for people to run their own models. We don't want to do what other people are doing?

Luke showing examples: 
1. Roboflow - trying to do a lot of things, what comes next? can do annotation and training in a browser - costs $
2. LILA BC - Google conservation team. Lots of detailed info on curated anootated datsets.
3. Fathomnet - Accept data annotated or not. Login required. One way. What happens with your data? How is this helpful. Can drill down to Medium articles, which point to other resources.
4. Wildme - Organize ML by taxa (wildbooks). Interactive annotation. Simple tech. docs.(linked). What happens with lots of use cases?

Overall: Things are not well organized, lots of clicks, what happens to data?

Enrique - What are user needs? What are the outputs? We should invest time into use cased and actually develop them (sound, imagery)

Luke - storymap. Can we structure our site this way? Easy to follow. Scroll down through steps in a workflow. One side is interactive.

DK - What is the question? Where are the gaps? Does a user have data? Can AI/ML answer their question? How do I start? Do I need to run a model? How much work will this be?

LM (to DK) - What do you wish you had known?

DK - 500 hours of video for PhD. Is annotation worth the time cost? Time, cost, who to talk to.

EM - Start with broad guidelines, then provide examples. 

DK - Many more examples now than in 2018, but can be highly technical. Tutorials would be helpful. Decision tree steps before tech. details.

TM - Important to know what exists (examples) and who to talk to? Pipeline publication service? Publishing the process. If we make our own tutorials, they will quickly become out of date.

Example - distill.pub (https://distill.pub/)

LM - Is there a glaring gap that is unaddressed? 

TM - I worry about data versioning with large datasets

FG - Have we linked to ESIP? https://www.esipfed.org/merge/collaboration-updates/checklist-ai-ready-data

Hassan (via chat) - VIAME tool - https://www.viametoolkit.org/ and https://www.noaa.gov/noaa-center-for-artificial-intelligence

These things are changing fast, how will this be updated? - I would call this an information hub.

Luke - This should be a gateway.

DK - Wildme also struggling with new techniques and how to keep current. New models  develop fast. However, this doesn't mean that older techniques are irrelevant, but there will always be new techniques.

LG - How well can a user expect this to work? Realistic expectations on the part of researchers is a good thing to emphasize with our site.

Hassan - TensorFlow playground - https://playground.tensorflow.org

Hassan - Ocean obs. users are limited by compute power. 

Kyle - What is the barrier to compute? I think it's not the lack of compute, but the lack of standards.

FG - plankton classifier w/folks in AK. IFCB or other plankton imager did not provide AI ready data. Using four algorithms. Takes forever on a single machine. Each epoch took 2 days. Wanted to use 40 epochs. Too long to process. Issue was worse w/metagenomics (scaled up).

Kyle - Without standards, this is not very useful. Data w/o metadata is not useful. Hard to compare results from two different researches. Need basic standards for metadata. 

FG - What is AI ready? Insufficient metadata is a big issue. ESIP is addressing this. People are free to join. 

HM - Standards are needed, but is just one piece of the puzzle. Most funds are going to the cloud.

Kyle - This is not an issue we should address here.

TM - A lot of people are working on these compute issues. This is complex and is a big hurdle for researchers. However, data needs to be AI ready w/proper metadata.

EM - Can relate w/plankton imager. Using a GPU machine to classify and to run a YOLO model took a week with poor results. Standards are important, but compute is also an issue and how users can tackle that. I don't have enough training data to achieve good results. Also an issue w/eDNA data. Sometimes, image quality is not sufficient.

DK - Kyle, What does good met data look like (say for images)? Should metadata be added before or after processing? 

Kyle - Example Webcam project. Standardize at camera level. Camera type/angle? How were images processed? All this info needs to be in the same file? Don't want a bunch of other files. Embed metadata in the image files. Why/when were still images from camera captured? Features are not embedded in files. Audio is more difficult. 

Lauren S. - example. https://www.ncei.noaa.gov/products/passivepacker

LM - How does metadata work with the Coralnet images? Need a specific source/link. People collect and upload images by source. Fairly straightforward. Minimum metadata: coords, time stamp, personnel, project name, affiliation. We need to define metadata fields for each use case type. This will add value to this project. What are the requirements from the user's prespective? 

TM - Our groups specialty is use cases for the ocean community. We can provide value in this area.

LM - We could help users pull data from these other sites that meet the needed criteria. 

EM - How can I relate my project needs to others that have done the same thing? How do I need to format my metadata? How much training data do I need? Can I see some example data? 

FG - High resolution plankton images (manually classified) in AK from tow data. Model is on GH somewhere? Used resnet 50 and image augmentation system. 80/20. 80% for training and 20% for validation.

LM - Where is the model now?

Lambda labs machines - https://lambdalabs.com/service/gpu-cloud?matchtype=p&adgroup=145739817502&feeditemid=&loc_interest_ms=&loc_physical_ms=9028157&network=g&device=c&devicemodel=&adposition=&utm_source=google&utm_campaign=Google_Search_Brand&utm_medium=search&utm_term=lambda%20computing&utm_content=397107687029&hsa_acc=1731978716&hsa_cam=20033599185&hsa_grp=145739817502&hsa_ad=397107687029&hsa_src=g&hsa_tgt=kwd-602946130712&hsa_kw=lambda%20computing&hsa_mt=p&hsa_net=adwords&hsa_ver=3&gclid=CjwKCAjwjMiiBhA4EiwAZe6jQ6-oKhweD_hGvbtc3VUF8fiDeVZsbrPpbGFqaKpKM49vVVYLrGRDchoClSsQAvD_BwE

Also can use cloud computing on the web (cheap)

FG - The data sources and needs need to be the same in order for things to be used as a template. Hard to share workflow pipeline if needs are different. Lots of iteration is needed. 

EM - This plankton example is a good one. It could be shared on this platform.

DK - I agree with this point. W/good metadata, we make things searchable by metadata. Could have a map of datasets w/metadata. Make datasets and projects discoverable w/o actually hosting the data. 

LM - Do we need to control access? Users would login? Maybe not for searching, but would be needed for upload/download.

EM - A place to discover who is doing what. Social media for ocean AI researchers? A way for researchers to try to stay current with the field.

LM - Event calendar and glossary would be helpful. 

What do we call this? Portal? Discovery Gateway? Digital Library?

DK - How can we generalize these models across projects? Could this info be in the metadata? If we make models/data discoverable/searchable/sharable, this would be beneficial. 









