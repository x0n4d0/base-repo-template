<div align='justify'>

# **Manjaro XFCE Minimal Setup**

> Script written in Shell Script Bash to automate the configuration of the new Linux Manjaro XFCE Minimal.

<br>

## **Download Manjaro**

- Remember to choose the Minimal version of Manjaro, preferably the LTS version;
- Go to the official Manjaro website by clicking the button:

<div align='center'>
<kbd>
<a href="https://manjaro.org/downloads/official/xfce/">Download Manjaro</a>
</kdb>
</div>

<br>
<br>

## **Run**

```bash
git clone https://github.com/x0n4d0/linux-manjaro-xfce-minimal-setup.git \
cd linux-manjaro-xfce-minimal-setup \
bash run.sh
```

### Development Mode

To run in development mode, you first need to install docker and docker-compose on your machine. After do this, you can start Manjaro Linux container.

Start container:
```bash
make start
```

Stop container:
```bash
make stop
```

Remove container and images:
```bash
make remove
```


</div>