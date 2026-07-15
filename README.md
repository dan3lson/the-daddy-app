# The Daddy App

The Daddy App is a web community built by dads, for dads.

Its goal is to give fathers a safe and supportive place to talk through real
life parenting moments, ask questions, share wins, and support each other.

## How this app supports the dad community

As of the latest commit, dads can:

- Create posts and join ongoing conversations
- Reply directly to other dads in nested discussion threads
- React to posts with emoji
- Answer a daily Question of the Day
- Invite other dads into the community
- Report harmful content and follow community guidelines
- Share product feedback and feature requests
- Participate in engagement-based rewards/raffles

## Core product areas

- **Signed-out experience:** homepage, waitlist, and sign-up/sign-in
- **Signed-in experience:** home feed, replies, reactions, moderation flags
- **Community features:** onboarding, invitations, support, FAQ, rewards
- **Admin area:** management for comments, users, topics, waitlist users, and more

## Tech stack

- Ruby on Rails 6
- PostgreSQL
- RSpec
- Webpacker + Bootstrap
- Sidekiq + Redis

## Local development

### Requirements

- Ruby `2.7.6`
- Node/Yarn
- PostgreSQL
- Redis

### Setup

```bash
bundle install
yarn install
bin/rails db:setup
```

### Run the app

```bash
bin/dev
```

If `bin/dev` is unavailable in your environment, run Rails and webpacker
processes separately.

### Test and lint

```bash
bundle exec rspec
bundle exec standardrb
```
