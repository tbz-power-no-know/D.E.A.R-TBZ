export function getDominantColor(imgSrc) {
  return new Promise((resolve) => {
    const img = new Image();
    img.crossOrigin = "anonymous";
    img.onload = () => {
      const canvas = document.createElement("canvas");
      const ctx = canvas.getContext("2d");
      const size = 50;
      canvas.width = size;
      canvas.height = size;
      ctx.drawImage(img, 0, 0, size, size);
      const data = ctx.getImageData(0, 0, size, size).data;
      const colorCounts = {};
      for (let i = 0; i < data.length; i += 16) {
        const r = Math.round(data[i] / 32) * 32;
        const g = Math.round(data[i + 1] / 32) * 32;
        const b = Math.round(data[i + 2] / 32) * 32;
        const key = `${r},${g},${b}`;
        colorCounts[key] = (colorCounts[key] || 0) + 1;
      }
      let maxKey = "0,0,0";
      let maxCount = 0;
      for (const key in colorCounts) {
        if (colorCounts[key] > maxCount) {
          maxCount = colorCounts[key];
          maxKey = key;
        }
      }
      const [r, g, b] = maxKey.split(",").map(Number);
      resolve(
        `#${r.toString(16).padStart(2, "0")}${g.toString(16).padStart(2, "0")}${b.toString(16).padStart(2, "0")}`
      );
    };
    img.onerror = () => resolve(null);
    img.src = imgSrc;
  });
}
