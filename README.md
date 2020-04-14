## Why i create this addon?
> Playing on private servers with high population, i found myself a little bit tired of monitoring interesting messages in "global" chat. For examples, finding groups in dungeons or pvp premade, or even work for enchant. So i decided to solve listed issues with a little bit of software engineering :)

## Which game versions are supported?
* `2.4.3`

## How addon works?
1. listen messages in all channels
2. each message is checked on specific keywords match
3. on success match at least of one keyword - addon print copy of message(only visible to you)
4. keywords may be defined by slash command(below)

## How to install?
1. Download from [Google Drive](https://drive.google.com/open?id=1WWUEKlO-0Fxa69G0N1Es0191-w7zyVLP)
2. Extract to `Wow/Interface/Addons` folder

## How to use?

`/cn enable` - enable addon

`/cn disable` - disable addon

`/cn enabled` - show is addon enabled

`/cn show` - show keywords

`/cn add my_keyword` - add keyword

`/cn remove my_keyword` - remove keyword by index(listed in `/cn show` command)

`/cn clear` - remove all keywords