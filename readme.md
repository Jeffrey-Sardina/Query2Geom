# Geometric Intersection Calculation

## Folders
geom/
- this is where all the code goes. It's bundled in here so that it can be mounted easily in Docker

install/
- manages initialising Docker image. It may require modification for different hardware, depending on which Torch binaries are supported by your GPU

geom/query2geom/
- this is for our modified system, using exact geometrical calculations for both box centre (something the original paper did) and offset (something the original paper did not seem to do).
- the original query2box system (using their attention mechanism) can still be run as well

## Root files
.gitignore
- files and folders to be ignored by Git

docker-compose.yml
- for creating and launching a Docker container. Note: this is not the *best* way to do it, but it works

readme.md
- yo dawg, I heard you liked readmes. So I put a readme in your readme, so you can read a readme while you read a readme
