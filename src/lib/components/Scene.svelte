<script lang="ts">
	import { T } from '@threlte/core';
	import { theme } from '$lib/stores/theme';
	import { onMount } from 'svelte';
	import * as THREE from 'three';

	let meshRef: THREE.Mesh;
	let materialRef: THREE.MeshPhysicalMaterial;

	$: currentTheme = $theme;

	// Create the geometry - an abstract crystalline shape
	const geometry = new THREE.IcosahedronGeometry(1, 1);

	// Material properties based on theme
	$: materialProps =
		currentTheme === 'minimal'
			? {
					color: '#f8f8f8',
					metalness: 0.1,
					roughness: 0.8,
					clearcoat: 0.1,
					iridescence: 0
				}
			: {
					color: '#ffffff',
					metalness: 0.2,
					roughness: 0.3,
					clearcoat: 0.8,
					iridescence: 1.0,
					iridescenceIOR: 1.3,
					iridescenceThicknessRange: [100, 800] as [number, number]
				};

	// Animation loop
	let animationId: number;
	let lastTime = 0;

	function animate(currentTime: number) {
		const delta = (currentTime - lastTime) / 1000; // Convert to seconds
		lastTime = currentTime;

		if (meshRef) {
			meshRef.rotation.x += delta * 0.2;
			meshRef.rotation.y += delta * 0.3;
		}

		animationId = requestAnimationFrame(animate);
	}

	onMount(() => {
		// Initial setup
		if (materialRef && currentTheme === 'vibrant') {
			materialRef.iridescence = 1.0;
		}

		// Start animation
		animationId = requestAnimationFrame(animate);

		// Cleanup on destroy
		return () => {
			if (animationId) {
				cancelAnimationFrame(animationId);
			}
		};
	});
</script>

<T.PerspectiveCamera makeDefault position={[0, 0, 4]} />

<T.DirectionalLight position={[10, 10, 5]} intensity={currentTheme === 'minimal' ? 1 : 1.5} />
<T.AmbientLight intensity={currentTheme === 'minimal' ? 0.4 : 0.6} />

<T.Mesh bind:ref={meshRef} {geometry} position={[0, 0, 0]} scale={1.5}>
	<T.MeshPhysicalMaterial bind:ref={materialRef} {...materialProps} />
</T.Mesh>
