# Configuring an Application in cluster with Argo CD

Below is a brief guide to creating an application in Argo CD and verifying that it works.

## Creating an Application in the Argo CD GUI
![ArgoCD_Synch_App](ArgoCD_Synch_App.gif)
1. In the Argo CD web UI, click **NEW APP**.
2. **Application Name** — enter your app name (e.g., `go-demo-app`).
3. **Project Name** — `default`.
4. Enable **Auto-Create Namespace**.
5. **Repository URL** — the repository with your manifests: `https://github.com/kors-dev/go-demo-app`.
6. **Path** — path to the manifests in the repo (e.g., `k8s/` or another relevant folder).
7. **Cluster URL** — `https://kubernetes.default.svc`.
8. **Namespace** — specify the target namespace (if **Auto-Create Namespace** is enabled, Argo CD will create it if it doesn't exist).
9. Click **Create**.
10. After the app is created, click **Sync** and wait until **APP HEALTH** becomes **Healthy**.
11. After pushing changes to your repository, click **Refresh** in Argo CD. If the status is **OutOfSync**, click **Sync** to force synchronization.

> **Tip:** If needed, you can enable **Auto-Sync** and **Self Heal** so that Argo CD automatically pulls changes and fixes drift in the cluster.

## Verifying the Application
![go_demo_app](go_demo_app.gif)
1. Port-forward to the API Gateway service (e.g., `ambassador`):

```bash
kubectl port-forward -n demo svc/ambassador 8081:80
```

2. Download a test image (JPEG) **into the current directory**:

```bash
wget -O ./flower.jpg 'https://upload.wikimedia.org/wikipedia/commons/3/3f/JPEG_example_flower.jpg'
```

3. Upload the image to your app via the API:

```bash
curl -F 'image=@./flower.jpg;type=image/jpeg' 'http://localhost:8081/img/'
```

