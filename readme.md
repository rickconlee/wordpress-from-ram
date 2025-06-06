# Wordpress From Ram

You can read my blog post about this, where I talk about the origins of this absurd project: [How To Run Wordpress from RAM](https://rickconlee.com/how-to-run-wordpress-completely-from-ram/) 

This is a living, breathing absurdist rendering of web application hosting. Performance tuning is an art form. I have created a new medium and a completely different way to think about hosting web applications. 

Basically, we are taking WordPress and loading STRAIGHT it into RAM with an absurdly optimized setup. That setup is as follows: 

- The entire site and services required to run Wordpress run from RAM. 
- The NGINX server is custom compiled.
- Sitefiles and database backup to S3 or S3-compatible storage using rclone. 
- Yes, even the database runs in RAM. Seriously. 

We are running everything from RAM to eliminate the time it takes to do disk I/O. Even on modern production-class SSDs and NVME's, you still have to go to disk for stuff. There is no reason I can see for the extra trip. This is a stateless monster. I pull it in from the void and run it. Then, when the server reboots, I just rerun the Ansible playbook. Zero fucks. There is no heaven or hell, just the void, where I will go once this is all over. 

By using S3 to persist storage and running everything from RAM, you can run this thing for around $40 USD/month to hosting this stack, depending on the instance class and provider where you choose to host it. 

So, you: 

- Save some money, possibly. 
- Go *really* fucking fast.

I built and benchmarked everything for absolutely first-hit raw uncached performance. If I could somehow bake the hosting stack into a chip, I would just do that, but I don't have the knowledge or resources for building ASICs. That would be the next logical evolution here. 

TODO: Rick, put the benchmarks here. 

# Initial Expectations 
You should see entire sites rendered under 300ms UNCACHED, depending on your proximity to the server hosting everything. This will change if you are using Cloudflare or a CDN. 


# What are your goals, Rick? 
Challenge everything about how we think about hosting, Wordpress, and perhaps life. 
