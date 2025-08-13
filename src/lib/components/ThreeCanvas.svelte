<script lang="ts">
	import { Canvas } from '@threlte/core';
	import { OrbitControls } from '@threlte/extras';
	import Scene from './Scene.svelte';
</script>

<div class="h-full w-full">
	<Canvas>
		<Scene />
		<OrbitControls enableZoom={false} enablePan={false} autoRotate autoRotateSpeed={0.5} />
	</Canvas>
</div>
