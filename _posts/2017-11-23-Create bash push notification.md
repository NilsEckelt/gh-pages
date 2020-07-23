---
layout: post
description: Get bash to send you push notifications
img: img/posh.jpg
---

# When to stop drinking coffee and get back to work?

![bash](/img/posh.jpg)
Currently I have some devops tasks. I love fast feedback cycles and therefore I really love TDD. Now some of my current doves tasks are running for some time.

Five minutes – fine, I'll chat about off-topics with my pairing partner.

Ten minutes – let's get coffee. Coffee run!

Twenty minutes – hell let's play kicker.

Now we get challenged and are going to play another round. And then, suddenly, my phone notifies me, my task is done and I could continue to work. Nice.
You know, our handhelds are called _smart_-phones, but where did my phone know the task was done?
That's where [IFTTT](http://ifttt.com) comes to play. Do you know it? It's a neat service for connecting services and IoT and likely everything.

As a developer, I can write my own services. I cannot publish it to you directly, because that is how they make money. That's totally fine. They don't deserve to starve. But as I'm not a company and this tiny tool is not my business, I'm going to share the steps and the code instead.
## Step 1
Login to IFTTT. Create an account f necessary.
## Step 2
Enable Maker Webhooks. See: [https://ifttt.com/maker_webhooks](https://ifttt.com/maker_webhooks)
Copy the api token. You'll need it.
## Step 3
Create a new _Applet_, choose Webhook as Trigger ('this') and follow the steps
## Step 4
Use a code like this
```bash
token="<YOUR_TOKEN>"
event_name="<SEE_STEP3>"
klingeling() {
	pipe=""
	while IFS= read -r line
	do
		pipe=$pipe"\n$line"
	done
	if [ $pipe ]
	then
		value1=$pipe
	else
		value1=$1
		shift 2> /dev/null
	fi
	value2=$1
	shift 2> /dev/null
	value3=$1
	curl -X POST -H "Content-Type: application/json" -d '{"value1":"'$value1'","value2":"'$value2'","value3":"'$valu3'"}' https://maker.ifttt.com/trigger/${event_name}/with/key/${token} > /dev/null 2>&1
}
```
## Step 5
Use in terminal like this:
`echo "Digger" || klingeling`

I hope you find this useful.

Side note: IFTTT can also help you tracking you time at a specific place. Office, client, pub, ...

Ahoi,  
&nbsp;Nils
