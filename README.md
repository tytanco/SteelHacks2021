# SteelHacks 2021: GoServe
## Inspiration
For our project, we started out by thinking of ways to connect with others and engage with the community. From this, we developed the idea of GoServe, an app focused on streamlining the connection between volunteers and organizations in need. Service is an important facet of our education as college students that not only cultivates new relationships, but can present unique opportunities for professional development and personal fulfillment. Despite this, finding volunteering opportunities can prove complicated or confusing, especially within a specific technical field or niche interest. The COVID-19 pandemic has compounded such issues by forcing companies to operate online, further hindering their ability to recruit volunteers. To help resolve this, we created a platform that promotes direct communication between volunteers and organizations, fostering a community between them. 

## What it does
Our app GoServe simplifies the process of finding an organization to volunteer with and facilitates social good in a modern context. We created the app with the user in mind; as a result, we made sure to prioritize a clean design and intuitive experience. The app utilizes a swiping feature to match volunteers with potential organizations based on their preferences. Users can customize these preferences with several features, including but not limited to: tags to filter by category (e.g. environmental, technology, community, etc.), a radius slider to adjust which volunteer opportunities are displayed to the user based on distance, a discovery page to learn more information about the various service categories and what they typically involve, and a profile page that logs the total number of volunteer hours for our users. The app features tags that highlight  both remote and/or on-site opportunities which are indicated in the organization’s bio and at a glance on the connect page. Should the user get a match, the app will pair them with a representative from their volunteer organization of interest to exchange information, chat, and send applications externally. Moreover, to further emphasize this direct connection, both individuals and organizations are able to log in/sign up for the service.

## How we built it
In terms of our work on the project, we all wanted to step out of our comfort zone and learn something new. This prompted us to start by trying out a new prototype development software called Figma. Figma allowed us to design each page of our app and export our images so that we could use the design elements we created when implementing the app in Xcode. Using Xcode, we set up features such as location detection and distance measuring for organizations as well as other backend features so that the app could function smoothly. Firebase was also utilized to store information regarding a variety of organizations. 

## Challenges we ran into
Some of the more challenging elements of our project were sorting organizations by location and determining the distance from the user’s current location, learning to use Firebase, creating an intuitive interface using Figma, and implementing external Swift libraries with CocoPods. The balance of developing our app and learning *how* to develop it was extremely challenging considering the lack of experience our team had in Swift application development. Regardless, we believe we were able to overcome our knowledge gap and produce impressive results in the form of GoServe.

## Accomplishments that we're proud of
- App asks for your current location and calculates the distance between you and the organization in real-time, adjusting to your device’s GPS positioning
- Implemented Firebase to store organization name, the position available, images, location of the organization (using latitude/longitude coordinates), and organization bios detailing the volunteering opportunities
- UX/UI design in Figma 
- Fully functional app downloaded onto team members’ phones 
- Unique functionally of the app gives a glimpse into the potential impact it could have on volunteer organization

## What we learned
Going into this project, most of the people on our team had little to no experience using databases, and none of us had worked with geolocation in apps before. Additionally, since Figma and UX/UI design is something many of us have not done before in general, the process of making design decisions was rather new and we spent a good deal of time learning the basic capabilities of the software. As we stated before though, we didn’t let this challenge stop us from completing a project we are all proud of.

## What's next for GoServe
- Launch app on Apple’s App Store
- Partner with OCC to help Pitt students find volunteer opportunities 
- Reach out to nonprofits in the Allegheny County area 
- Implement a “friends” feature in which users can view each other’s hours and organizations they’re - currently volunteering at
- Chat functionality with other volunteers in addition to organizations
- Set up app notifications when users receive new chat invitations