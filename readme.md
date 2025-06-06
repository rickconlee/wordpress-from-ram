# Wordpress From Ram

This is a living breathing absurdist rendering of web application hosting. This is performance tuning as an art form. I have created a new medium, as well as a completely different way to think about hosting web applications. 

Basically, what are doing is taking WordPress, and loading it into RAM, with an absurdly optimized setup. That setup is as follows: 

- Entire site and services required to run Wordpress run from RAM. 
- The NGINX server is custom compiled.
- Sitefiles and database backup to S3 or S3 compatible storage using rclone. 
- Yes, even the database runs in RAM. Seriously. 

The reason that we are running everything from RAM is to eliminate the time it takes to do disk I/O. Even on modern production-class SSD's and NVME's, you still have to go to disk for stuff. There is no reason I can see for the extra trip. This is a stateless monster. I pull it in from the void, run it, then when the server reboots, I just rerun the ansible playbook. Zero fucks. There is no heaven or hell, just the void - where I will go once this is all over. 

By using S3 to persist storage, and running everything from RAM, you set yourself up to save an average of $20/month to host this thing depending on the instance class and provider where you choose to host this thing. 

So, you: 

- Save some money possibly. 
- Go really fucking fast.

I built and benchmarked everything for absolutely first hit raw uncached performance. If I could somehow bake the hosting stack into a chip, I woudl just do that, but I dont have the knowledge or resources for building ASIC's. That would be the next logical evolution, here. 

# My Initial Expectations 

You should see entire sites rendered un under 300ms UNCACHED depending on your proximity to the server that you are hosting everything on. This will change if you are using Cloudflare or a CDN. 


# What are your goals, Rick? 

Challenge everything about how we think about hosting wordpress. 
