# NETWORKING AUTOMATIZADO CON GITOPS - Javier Sánchez Páez

En este repositorio se podrán ver los cambios y versiones que voy añadiendo al proyecto para la asignatura PI (proyecto integrado). Para poder descargarlo, tan solo habrá que ejecutar en una shell:

```
git clone git@github.com:javsanpae/PROYECTO_ASIR.git
```

## Idea del proyecto

Cada vez que tenemos que pensar en hacer cambios en una red nos echamos las manos a la cabeza. Es fácil que, al momento, nos vengan pensamientos de:

- ¿Cómo voy a configurar mis dispositivos de uno en uno?
- ¿Cómo voy a aprenderme todos los comandos que tiene cada uno de los sistemas operativos para dispositivos de red?
- ¿Y si no funciona lo que quiero hacer?

Es por ello que nació la idea de **Infraestructura como código (IaC)**. De esta manera, podíamos hacer cambios en nuestra infraestructura de forma simple y fácil, pero todavía se nos escapa un posible escenario: **¿Y si no funciona lo que quiero hacer?**. Para dar una solución a este problema, tenemos que hablar de GitOps.

### GitOps

En resumidas cuentas, lo que GitOps nos permite es tener un mejor control del software que vayamos escribiendo y usando nuestro repositorio (GitHub, Gitlab, Bitbucket) como **fuente de la verdad**. Básicamente la fuente de la verdad significa que todo el código fuente con el que automaticemos la infraestructura vendrá del repositorio y no permitiremos cambios "desde fuera". Implícitamente con GitOps también tendremos un concepto añadido: Guardar todos los datos (incluidos secrets) en el repositorio. De esta manera tendremos una infraestructura "portable".
Así, si usamos GitOps en conjunción con herramientas CI/CD (Jenkins, Ansible) tendremos un flujo de trabajo automatizado, estable y que puede reaccionar a errores haciendo rollbacks.