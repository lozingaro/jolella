# Jolella

Jolella is the project for the laboratory of Operative Systems Course, academic
year 2018-19, bachelor degree in Computer Science for Management at University
of Bologna.

## Getting Started

This repository contains the documentation for the implementation and delivery
of the project; examples of the code to use; the instructions for building the
group and some basic on the *git* tools.

### Prerequisities [tested]

- *[mandatory]* Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
- *[mandatory]* Jolie 1.7.1 (C) 2006-2019 the Jolie team
- *[optional]* Apache Maven 3.6.0

## Running tests

Remember to run `jolie --check <service>.ol` before to run and check for syntax
errors.

1. *[new shell]* Run the Network Monitor, it serves as printer for the logs
status of the p2p network. Each time a node (**every node!**), performs an
action, it sends a proper message to the monitor, that will print the message on
the console.

```sh
jolie src/monitor.ol
```

2. *[new shell]* Start the JOLELLA network as an *HTTP* service on port 8000
(the default one, feel free to change it).

```sh
jolie src/jolella.ol
```

3. *[new shell]* Run **each** JEER within a different shell launching a command
similar to the one reported below, just changing the number of the port (9001,
in this case). The `-C` options let you define a **CONSTANT** that the `jeer.ol`
service will use, named *MY_ADDRESS* - [see here for more details on Jolie
constants](https://jolielang.gitbook.io/docs/basics/constants).

```sh
jolie -C MY_ADDRESS=\"socket://localhost:9001\" src/jeer.ol
```

  **N.B.** It is possible to add `2>/dev/null` at the end of the command to tell
  the terminal to avoid *printing errors to the console* (**IT WORKS ONLY ON
  **UNIX - NOT WINDOWS! - SYSTEMS**).

4. **Note that,** in principle, the whole interaction with the p2p network can
be made via *REST API*. In particular, the JILE lookup, the service to look for
the files, can be acccessed via *HTTP* at the address `localhost:8000` (or the
port you chose, 8000 is the default one). For the sake of simplicity, we
condiser matching just with the name of the file (no metadata - author, title,
etc. - search is provided). A simple **curl** command for the *lookup* of a JILE
would be ( `-v` for *verbose* output ):

```sh
curl -v http://localhost:8000/lookup?jid
```

5. *[new shell]* Test the JOLELLA network against a "bad" behaviouring JEER -- a
node that will try to connect with already exiting information. The network
should be able to detect this attack and answer back raising an error. A simple
command that use **curl** could be ( `-v` for *verbose* output ):

```sh
curl -v http://localhost:8000/register?address=socket://localhost:9001
```

### Important Notes

To build up a testing `JileStore` environment, I took advantage of the free
*REST* service [thinkbroadband](https://www.thinkbroadband.com), that allows one
to pick a *ZIP* file from their service, of (almost) any size. Do not try open
the `.zip` files, *they are not valid*.

Using `curl` ([Manual](https://curl.haxx.se/docs/manual.html)) and the following
code, is pretty easy to download dynamically the file that we need in the moment
we need it.

```jolie
execRequest = "curl";
with( execRequest ){
  .args[0] = "-L";
  .args[1] = "http://ipv4.download.thinkbroadband.com:81/5MB.zip";
  .args[2] = "-O";
  .workingDirectory = "jileStore";
  .stdOutConsoleEnable = true
};
exec@Exec( execRequest )( execResponse )
```

## Built With

* [Java](https://openjdk.java.net/) - The Programming Language used for to build the Java Service;
* [Jolie](https://www.jolie-lang.org/) - The Programming Language used to build the Interface for the file worker service.
* [Apache Maven](https://maven.apache.org/) - The Software project managemente to pack up Java dependencies and build the jar.

## Contributing

Please read [CONTRIBUTING](CONTRIBUTING.md) for details on our code of conduct,
and the process for submitting pull requests to us.

## Authors

* **PhD Student Stefano Pio Zingaro** [@szingaro](https://github.com/szingaro) - *Code and Maintenance* - [WebSite](http://cs.unibo.it/~stefanopio.zingaro)

## License

This project is licensed under the GNU v.3 License - see the [LICENSE](LICENSE)
file for details
